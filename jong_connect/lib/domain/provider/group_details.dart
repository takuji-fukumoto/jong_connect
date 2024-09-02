import 'dart:async';

import 'package:jong_connect/data/groups_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/group.dart';

part 'group_details.g.dart';

@riverpod
Future<Group> groupDetails(GroupDetailsRef ref, {required int groupId}) async {
  return await ref.watch(groupsRepositoryProvider).getGroupDetails(groupId);
}
