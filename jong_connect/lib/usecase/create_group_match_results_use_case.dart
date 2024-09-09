import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:jong_connect/domain/model/match_result_records.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_group_match_results_use_case.g.dart';

@riverpod
class CreateGroupMatchResultsUseCase extends _$CreateGroupMatchResultsUseCase {
  @override
  MatchResultRecords build(int groupId, MatchType type) {
    return MatchResultRecords(groupId: groupId, matchType: type);
  }

  void addRoundResults(List<GroupMatchResult> results) {
    state = state.addResults(results);
  }

  void editRoundResults(List<GroupMatchResult> results) {
    state = state.editResults(results);
  }

  void deleteRoundResults(int targetOrder) {
    state = state.deleteResults(targetOrder);
  }

  Future<void> register() async {
    await ref
        .read(groupMatchesRepositoryProvider)
        .createWithResults(state.groupId, state.matchType, state.results);
  }
}
