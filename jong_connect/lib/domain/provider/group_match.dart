import 'dart:async';

import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_match.g.dart';

@riverpod
Future<GroupMatch> groupMatch(GroupMatchRef ref,
    {required int groupMatchId}) async {
  return await ref.watch(groupMatchesRepositoryProvider).get(groupMatchId);
}
