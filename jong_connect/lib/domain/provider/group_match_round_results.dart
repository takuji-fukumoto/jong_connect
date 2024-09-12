import 'dart:async';

import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/group_match_result.dart';

part 'group_match_round_results.g.dart';

@riverpod
Future<List<GroupMatchResult>> groupMatchRoundResults(
    GroupMatchRoundResultsRef ref,
    {required int groupMatchId,
    required int matchOrder}) async {
  return await ref
      .watch(groupMatchResultsRepositoryProvider)
      .getByMatchOrder(groupMatchId, matchOrder);
}
