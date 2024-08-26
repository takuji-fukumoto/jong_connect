import 'dart:async';

import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/app_user_repository.dart';

part 'register_user_use_case.g.dart';

@riverpod
RegisterUserUseCase registerUserUseCase(RegisterUserUseCaseRef ref) =>
    RegisterUserUseCase(ref);

class RegisterUserUseCase {
  late RegisterUserUseCaseRef _ref;

  RegisterUserUseCase(RegisterUserUseCaseRef ref) {
    _ref = ref;
  }

  Future<void> execute(String name, String profile, String avatarUrl) async {
    final user = await _ref.read(currentUserProvider.future);

    if (user == null) {
      throw Exception('ユーザー情報の取得に失敗しました');
    }

    final newUser =
        user.copyWith(name: name, profile: profile, avatarUrl: avatarUrl);
    await _ref.read(appUserRepositoryProvider).update(newUser);

    // current_user更新
    _ref.invalidate(currentUserProvider);
  }
}
