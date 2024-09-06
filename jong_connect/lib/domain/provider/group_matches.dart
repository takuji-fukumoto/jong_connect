import 'dart:async';

import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_matches.g.dart';

@riverpod
Future<List<GroupMatch>> groupMatches(GroupMatchesRef ref,
    {required int groupId}) async {
  return await ref
      .watch(groupMatchesRepositoryProvider)
      .getWithResults(groupId);
}
