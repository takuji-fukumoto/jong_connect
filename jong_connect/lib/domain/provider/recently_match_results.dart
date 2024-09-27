import 'dart:async';

import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/domain/model/group_round_match_result.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recently_match_results.g.dart';

@riverpod
Future<List<GroupRoundMatchResult>> recentlyMatchResults(
    RecentlyMatchResultsRef ref,
    {int limit = 3}) async {
  final user = await ref.watch(currentUserProvider.future);

  if (user == null) {
    return [];
  }

  return await ref
      .read(groupMatchResultsRepositoryProvider)
      .getRecentlyResults(user.id, limit: limit);
}
