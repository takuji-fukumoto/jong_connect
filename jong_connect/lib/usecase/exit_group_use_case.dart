import 'dart:async';

import 'package:jong_connect/data/groups_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exit_group_use_case.g.dart';

@riverpod
ExitGroupUseCase exitGroupUseCase(ExitGroupUseCaseRef ref) =>
    ExitGroupUseCase(ref);

class ExitGroupUseCase {
  final ExitGroupUseCaseRef _ref;

  ExitGroupUseCase(this._ref);

  Future<void> execute({required int groupId}) async {
    await _ref.read(groupsRepositoryProvider).exitFromGroup(groupId);
    // TODO:rooms自動更新されるか確認
    // _ref.invalidate(groupDetailsProvider(groupId: newGroup.id));
  }
}
