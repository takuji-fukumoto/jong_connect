import 'dart:async';

import 'package:jong_connect/data/app_user_repository_impl.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/app_user.dart';

part 'register_user_use_case.g.dart';

@riverpod
RegisterUserUseCase registerUserUseCase(RegisterUserUseCaseRef ref) =>
    RegisterUserUseCase(ref);

class RegisterUserUseCase {
  late RegisterUserUseCaseRef _ref;

  RegisterUserUseCase(RegisterUserUseCaseRef ref) {
    _ref = ref;
  }

  Future<void> execute(
      String name, String friendId, String profile, String avatarUrl) async {
    final user = await _ref.read(currentUserProvider.future);

    if (user == null) {
      throw Exception('ユーザー情報の取得に失敗しました');
    }

    final newUser = AppUser(
        id: user.id,
        name: name,
        profile: profile,
        avatarUrl: avatarUrl,
        friendId: friendId);
    await _ref.read(appUserRepositoryImplProvider).put(newUser);

    // current_user更新
    _ref.invalidate(currentUserProvider);
  }

  Future<bool> existsFriendId(String friendId) async {
    return await _ref
        .read(appUserRepositoryImplProvider)
        .existsFriendId(friendId);
  }
}
