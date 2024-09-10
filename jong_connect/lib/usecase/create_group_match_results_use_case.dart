import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/domain/model/match_result_records.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/provider/group_matches.dart';

part 'create_group_match_results_use_case.g.dart';

@riverpod
class CreateGroupMatchResultsUseCase extends _$CreateGroupMatchResultsUseCase {
  @override
  MatchResultRecords build(int groupId, String matchTypeName) {
    var type = MatchType.values.byName(matchTypeName);
    return MatchResultRecords(groupId: groupId, matchType: type);
  }

  void addRoundResults(List<InputUserScore> results) {
    state = state.addResults(results);
  }

  void editRoundResults(int targetOrder, List<InputUserScore> results) {
    state = state.editResults(targetOrder, results);
  }

  void deleteRoundResults(int targetOrder) {
    state = state.deleteResults(targetOrder);
  }

  Future<void> register() async {
    var createdUser = await ref.read(currentUserProvider.future);
    await ref.read(groupMatchesRepositoryProvider).createWithResults(
        state.groupId, createdUser!, state.matchType, state.results);
    // 対局結果リストリフレッシュ
    ref.watch(groupMatchesProvider(groupId: state.groupId));
  }
}
