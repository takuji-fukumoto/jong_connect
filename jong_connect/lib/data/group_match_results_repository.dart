import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_match_result_raw.dart';
import 'group_match_results_repository_impl.dart';

part 'group_match_results_repository.g.dart';

@riverpod
GroupMatchResultsRepository groupMatchResultsRepository(
        GroupMatchResultsRepositoryRef ref) =>
    GroupMatchResultsRepositoryImpl();

class GroupMatchResultsRepository {
  Future<GroupMatchResult> get(int id) async {
    throw UnimplementedError();
  }

  Future<List<GroupMatchResult>> getGroupMatchResults(int groupMatchId) async {
    throw UnimplementedError();
  }

  Future<List<GroupMatchResult>> getByMatchOrder(
      int groupMatchId, int matchOrder) async {
    throw UnimplementedError();
  }

  Future<void> createRoundResults({
    required int groupMatchId,
    required int matchOrder,
    required List<GroupMatchResultRaw> results,
  }) async {
    throw UnimplementedError();
  }

  Future<void> upsert(List<GroupMatchResult> result) async {
    throw UnimplementedError();
  }

  Future<void> deleteRoundResults(
      {required int groupMatchId, required int matchOrder}) async {
    throw UnimplementedError();
  }
}
