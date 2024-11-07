import 'dart:async';

import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_match_results_stream.g.dart';

@riverpod
Stream<List<GroupMatchResult>> groupMatchResultsStream(
    GroupMatchResultsStreamRef ref, int groupMatchId) {
  return ref
      .watch(groupMatchResultsRepositoryProvider)
      .getGroupMatchResultsStream(groupMatchId);
}
