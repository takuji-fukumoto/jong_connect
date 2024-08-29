import 'dart:async';

import 'package:jong_connect/data/groups_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/group.dart';

part 'joined_groups.g.dart';

@riverpod
Stream<List<Group>> joinedGroups(JoinedGroupsRef ref) {
  return ref.watch(groupsRepositoryProvider).getGroupsStream();
}
