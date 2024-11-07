import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/app_user.dart';
import '../domain/model/group_match.dart';
import '../util/constants.dart';
import 'group_matches_repository_impl.dart';

part 'group_matches_repository.g.dart';

@riverpod
GroupMatchesRepository groupMatchesRepository(GroupMatchesRepositoryRef ref) =>
    GroupMatchesRepositoryImpl();

class GroupMatchesRepository {
  Future<GroupMatch> get(int groupMatchId) async {
    throw UnimplementedError();
  }

  Future<List<GroupMatch>> getAll(int groupId, {int limit = 50}) async {
    throw UnimplementedError();
  }

  Stream<GroupMatch?> getLatestGroupMatchStream(int groupId) {
    throw UnimplementedError();
  }

  Future<GroupMatch> create(
      int groupId, AppUser createdUser, MatchType type) async {
    throw UnimplementedError();
  }

  Future<void> createWithResults(int groupId, AppUser createdUser,
      MatchType type, List<GroupMatchResult> results) async {
    throw UnimplementedError();
  }

  Future<void> updateResults(
      int groupMatchId, List<GroupMatchResult> results) async {
    throw UnimplementedError();
  }

  Future<void> closeMatch(int groupMatchId) async {
    throw UnimplementedError();
  }

  Future<void> delete(int groupMatchId) async {
    throw UnimplementedError();
  }
}
