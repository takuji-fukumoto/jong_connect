import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/domain/model/match_result_records.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/util/constants.dart';
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

    await _ref.read(groupMatchResultsRepositoryProvider).createRoundResults(
        groupMatchId: groupMatch.id,
        matchOrder: matchOrder,
        results: GroupMatchResultRaw.convertFromRoundInputScores(
            scores, groupMatch.matchType));

    // 対局結果更新
    _ref.invalidate(groupMatchProvider(groupMatchId: groupMatch.id));
  }

  Future<void> editRoundResults(int matchOrder, MatchType type,
      List<GroupMatchResult> originResults, List<InputUserScore> scores) async {
    if (originResults.length != scores.length) {
      throw const CalcMatchResultsException('変更前と変更後の集計数が異なります');
    }

    var fixedResults = <GroupMatchResult>[];
    var rawResults =
        GroupMatchResultRaw.convertFromRoundInputScores(scores, type);
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

    _ref.read(groupMatchResultsRepositoryProvider).upsert(fixedResults);

    // 対局結果更新
    _ref.invalidate(groupMatchProvider);
  }

  Future<void> register(int groupId) async {
    // TODO: group_matchにend_atを追記して、group_matchesを更新かける
  }
}
