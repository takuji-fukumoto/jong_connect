import 'dart:async';

import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/constants.dart';
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

  Future<void> execute(AppUser user) async {
    await supabase.from('users').update({
      'name': user.name,
      'profile': user.profile,
      'avatar_url': user.avatarUrl,
    }).eq('id', user.id);

    // current_user更新
    _ref.invalidate(currentUserProvider);
  }
}
