import 'dart:async';

import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/group_matches_repository.dart';
import '../../data/groups_repository.dart';
import '../model/group_match.dart';

part 'recently_match_results.g.dart';

@riverpod
Future<List<GroupMatch>> recentlyMatchResults(RecentlyMatchResultsRef ref,
    {int limit = 3}) async {
  final user = await ref.watch(currentUserProvider.future);

  if (user == null) {
    return [];
  }

  final joinedGroups = await ref.watch(groupsRepositoryProvider).getGroups();

  if (joinedGroups.isEmpty) {
    return [];
  }

  final joinedGroupIds = joinedGroups.map((group) => group.id).toList();

  return await ref
      .read(groupMatchesRepositoryProvider)
      .getRecentlyMatchesInGroups(joinedGroupIds, limit: limit);
}
