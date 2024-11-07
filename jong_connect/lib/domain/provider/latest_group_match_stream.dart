import 'dart:async';

import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/group_match.dart';

part 'latest_group_match_stream.g.dart';

@riverpod
Stream<GroupMatch?> latestGroupMatchStream(
    LatestGroupMatchStreamRef ref, int groupId) {
  return ref
      .watch(groupMatchesRepositoryProvider)
      .getLatestGroupMatchStream(groupId);
}
