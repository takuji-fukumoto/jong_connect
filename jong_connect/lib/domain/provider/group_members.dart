import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_user.dart';

part 'group_members.g.dart';

@riverpod
Future<List<AppUser>> groupMembers(GroupMembersRef ref, int groupId) async {
  var group = await ref.read(groupDetailsProvider(groupId: groupId).future);
  var members =
      group.joinedUsers?.map<AppUser>((joinUser) => joinUser.user!).toList() ??
          [];
  return members;
}
