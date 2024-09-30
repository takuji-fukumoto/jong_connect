import 'dart:collection';
import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/domain/provider/game_config.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/extensions/round56.dart';
import 'package:jong_connect/util/extensions/swap.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_match.dart';
import '../domain/model/group_match_result.dart';
import '../domain/model/group_match_result_raw.dart';
import '../domain/provider/group_match.dart';
import '../domain/provider/group_matches.dart';
import '../util/exceptions/calc_match_results_exception.dart';

part 'group_match_results_use_case.g.dart';

@riverpod
GroupMatchResultsUseCase groupMatchResultsUseCase(
        GroupMatchResultsUseCaseRef ref) =>
    GroupMatchResultsUseCase(ref);

class GroupMatchResultsUseCase {
  final GroupMatchResultsUseCaseRef _ref;

  GroupMatchResultsUseCase(this._ref);

  Future<GroupMatch> createGroupMatch(int groupId, MatchType type) async {
    var user = await _ref.read(currentUserProvider.future);
    if (user == null) {
      throw Exception('ログインしてください');
    }

    return await _ref
        .read(groupMatchesRepositoryProvider)
        .create(groupId, user, type);
  }

  Future<void> addRoundResults(GroupMatch groupMatch,
      List<InputUserScore> scores, int matchOrder) async {
    if (scores.length != groupMatch.matchType.playableNumber) {
      throw const CalcMatchResultsException('対局タイプと集計数が一致しません');
    }

    var rawResults = await _calcTotalPoints(scores, groupMatch.matchType);
    await _ref.read(groupMatchResultsRepositoryProvider).createRoundResults(
        groupMatchId: groupMatch.id,
        matchOrder: matchOrder,
        results: rawResults);

    // 対局結果更新
    _ref.invalidate(groupMatchProvider(groupMatchId: groupMatch.id));
  }

  Future<void> editRoundResults(int matchOrder, MatchType type,
      List<GroupMatchResult> originResults, List<InputUserScore> scores) async {
    if (originResults.length != scores.length) {
      throw const CalcMatchResultsException('変更前と変更後の集計数が異なります');
    }

    // DBのユニーク制約に引っかからないように同じuser_idのレコードは同じIDになるようにする
    // MEMO: group_match_resultにはgroup_match_id,user_id,match_orderの複合キーを設定している
    var originUserIds = originResults
        .where((result) => result.userId != null)
        .map<String>((result) => result.userId!)
        .toSet();
    var newUserIds = scores.map<String>((score) => score.user.id).toSet();
    // ユーザーIDが重複しているリスト
    var duplicatedUserIds = originUserIds.intersection(newUserIds);
    final remainIds = ListQueue<int>();
    remainIds.addAll(originResults
        .where((result) => !duplicatedUserIds.contains(result.userId ?? ''))
        .map<int>((result) => result.id));
    // ユーザーID => 割り振られたID
    Map<String, int> outputIds = {};
    for (var score in scores) {
      if (duplicatedUserIds.contains(score.user.id)) {
        // 重複しているレコードのIDをセット
        outputIds[score.user.id] = originResults
            .firstWhere((result) => result.userId == score.user.id)
            .id;
      } else {
        // 残りのIDから取り出してセット
        outputIds[score.user.id] = remainIds.removeFirst();
      }
    }

    var fixedResults = <GroupMatchResult>[];
    var rawResults = await _calcTotalPoints(scores, type);
    for (var i = 0; i < originResults.length; i++) {
      fixedResults.add(GroupMatchResult(
          id: outputIds[rawResults[i].user.id]!,
          groupMatchId: originResults[i].groupMatchId,
          score: rawResults[i].score,
          rank: rawResults[i].rank,
          totalPoints: rawResults[i].totalPoints,
          matchOrder: matchOrder,
          createdAt: originResults[i].createdAt,
          // MEMO: 退会済みユーザーの場合ここで空白が来るのでnullで登録
          userId: rawResults[i].user.id.isEmpty ? null : rawResults[i].user.id,
          userName: rawResults[i].user.name));
    }

    await _ref.read(groupMatchResultsRepositoryProvider).upsert(fixedResults);

    // 対局結果更新
    _ref.invalidate(
        groupMatchProvider(groupMatchId: originResults.first.groupMatchId!));
  }

  Future<void> deleteRoundResults(int groupMatchId, int matchOrder) async {
    await _ref
        .read(groupMatchResultsRepositoryProvider)
        .deleteRoundResults(groupMatchId: groupMatchId, matchOrder: matchOrder);
    // 対局結果更新
    _ref.invalidate(groupMatchProvider(groupMatchId: groupMatchId));
  }

  Future<void> closeMatch(GroupMatch match) async {
    await _ref.read(groupMatchesRepositoryProvider).closeMatch(match.id);
    _ref.invalidate(groupMatchesProvider(groupId: match.groupId));
  }

  Future<void> deleteMatch(GroupMatch match) async {
    await _ref.read(groupMatchesRepositoryProvider).delete(match.id);
    _ref.invalidate(groupMatchesProvider(groupId: match.groupId));
  }

  Future<List<GroupMatchResultRaw>> _calcTotalPoints(
      List<InputUserScore> inputScores, MatchType type) async {
    // スコアが高い順にトータルスコア算出
    inputScores.sort((a, b) => b.score.compareTo(a.score));
    for (var i = 0; i < inputScores.length; i++) {
      for (var j = i + 1; j < inputScores.length; j++) {
        // 同じスコアの人がいたら、座順通りに並び替える
        if (inputScores[i].score == inputScores[j].score &&
            inputScores[i].seatingOrder > inputScores[j].seatingOrder) {
          inputScores.swap(i, j);
        }
      }
    }

    var totalPointsWithoutTop = 0;
    var outputResults = <GroupMatchResultRaw>[];
    for (var i = inputScores.length - 1; i > 0; i--) {
      var rank = i + 1;

      final gameConfig = await _ref.read(gameConfigProvider.future);
      // 5捨6入
      var fixedScore = (inputScores[i].score / 1000).round56();
      // 点数のポイント変換
      var totalPoints = fixedScore - gameConfig!.settlementScore ~/ 1000;

      // ウマ加点
      totalPoints += gameConfig.positionPoints[i];
      totalPointsWithoutTop += totalPoints;

      outputResults.add(GroupMatchResultRaw(
        user: inputScores[i].user,
        score: inputScores[i].score,
        rank: rank,
        totalPoints: totalPoints,
      ));
    }

    // トップの人は他の人のマイナス分総取り
    outputResults.add(GroupMatchResultRaw(
      user: inputScores[0].user,
      score: inputScores[0].score,
      rank: 1,
      totalPoints: totalPointsWithoutTop.abs(),
    ));

    return outputResults;
  }
}
