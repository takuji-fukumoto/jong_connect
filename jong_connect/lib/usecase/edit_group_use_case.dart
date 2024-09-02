import 'dart:async';

import 'package:jong_connect/data/groups_repository.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/model/app_user.dart';
import '../domain/model/group.dart';
import '../domain/model/user_joined_group.dart';

part 'edit_group_use_case.g.dart';

@riverpod
EditGroupUseCase editGroupUseCase(EditGroupUseCaseRef ref) =>
    EditGroupUseCase(ref);

class EditGroupUseCase {
  final EditGroupUseCaseRef _ref;

  EditGroupUseCase(this._ref);

  Future<void> execute(
      {required int id,
      required String name,
      required String description,
      required String imageUrl,
      required List<AppUser> joinUsers}) async {
    final newGroup = Group(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      joinedUsers: joinUsers
          .map<UserJoinedGroup>((user) => UserJoinedGroup(user: user))
          .toList(),
    );

    await _ref.read(groupsRepositoryProvider).update(newGroup);
    // detail更新
    _ref.invalidate(groupDetailsProvider(groupId: newGroup.id));
  }
}
