import 'dart:async';

import 'package:jong_connect/data/groups_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/model/app_user.dart';

part 'create_group_use_case.g.dart';

@riverpod
CreateGroupUseCase createGroupUseCase(CreateGroupUseCaseRef ref) =>
    CreateGroupUseCase(ref);

class CreateGroupUseCase {
  final CreateGroupUseCaseRef _ref;

  CreateGroupUseCase(this._ref);

  Future<int> execute(
      {required String name,
      required String description,
      required List<AppUser> joinUsers}) async {
    return await _ref
        .read(groupsRepositoryProvider)
        .create(name, description, joinUsers);
  }
}
