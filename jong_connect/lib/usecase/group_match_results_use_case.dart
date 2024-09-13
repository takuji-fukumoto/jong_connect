import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/domain/provider/game_config.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_match.dart';
import '../domain/model/group_match_result.dart';
import '../domain/model/group_match_result_raw.dart';
import '../domain/provider/group_match.dart';
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

    var fixedResults = <GroupMatchResult>[];
    var rawResults = await _calcTotalPoints(scores, type);
    for (var i = 0; i < originResults.length; i++) {
      fixedResults.add(GroupMatchResult(
          id: originResults[i].id,
          groupMatchId: originResults[i].groupMatchId,
          score: rawResults[i].score,
          rank: rawResults[i].rank,
          totalPoints: rawResults[i].totalPoints,
          matchOrder: matchOrder,
          createdAt: originResults[i].createdAt,
          userId: rawResults[i].user.id,
          userName: rawResults[i].user.name));
    }

    await _ref.read(groupMatchResultsRepositoryProvider).upsert(fixedResults);

    // 対局結果更新
    _ref.invalidate(
        groupMatchProvider(groupMatchId: originResults.first.groupMatchId!));
  }

  Future<void> register(int groupMatchId) async {
    // TODO: group_matchにend_atを追記して、group_matchesプロバイダに更新かける
  }

  Future<List<GroupMatchResultRaw>> _calcTotalPoints(
      List<InputUserScore> inputScores, MatchType type) async {
    // 重複チェック
    // TODO: スコアが重複している場合座順もチェックする
    var scores = inputScores.map<int>((value) => value.score).toSet().toList();
    if (scores.length < type.playableNumber) {
      throw const CalcMatchResultsException('スコアが重複しています');
    }

    // スコアが高い順にトータルスコア算出
    inputScores.sort((a, b) => b.score.compareTo(a.score));
    var outputResults = <GroupMatchResultRaw>[];
    for (var i = 0; i < inputScores.length; i++) {
      var rank = i + 1;
      var scoreString = inputScores[i].score.toString();
      if (scoreString.length >= 3) {
        // 5捨6入
        if (int.parse(scoreString[scoreString.length - 3]) > 5) {
          scoreString = scoreString.replaceRange(
              scoreString.length - 4,
              scoreString.length - 3,
              (int.parse(scoreString[scoreString.length - 4]) + 1).toString());
        }
      }
      final gameConfig = await _ref.read(gameConfigProvider.future);
      // 点数のポイント変換
      var totalPoints = (int.parse(scoreString) / 1000).floor() -
          (gameConfig!.settlementScore / 1000) as int;

      // ウマ加点
      totalPoints += gameConfig.positionPoints[i];

      // オカ加点
      if (rank == 1) {
        final oka =
            (gameConfig.settlementScore - gameConfig.initialStartingPoint) *
                type.playableNumber;
        totalPoints += (oka / 1000) as int;
      }

      outputResults.add(GroupMatchResultRaw(
        user: inputScores[i].user,
        score: inputScores[i].score,
        rank: rank,
        totalPoints: totalPoints,
      ));
    }

    return outputResults;
  }
}
