import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';
import '../domain/provider/auth_state.dart';

part 'user_auth_use_case.g.dart';

@riverpod
UserAuthUseCase userAuthUseCase(UserAuthUseCaseRef ref) => UserAuthUseCase(ref);

class UserAuthUseCase {
  final UserAuthUseCaseRef _ref;

  UserAuthUseCase(this._ref);

  Future<AuthResponse> signInWithPassword(String email, String password) async {
    return await supabase.auth
        .signInWithPassword(password: password, email: email);
  }

  Future<AuthResponse> signInAnonymously() async {
    return await supabase.auth.signInAnonymously();
  }

  Future<UserResponse> linkIdentity(String email, String password) async {
    return await supabase.auth
        .updateUser(UserAttributes(email: email, password: password));
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  void signOut() async {
    await supabase.auth.signOut();
  }

  void deleteUser() async {
    throw UnimplementedError();
    // final user = _ref.read(authStateNotifierProvider).authState?.session?.user;
    // if (user == null) {
    //   throw Exception('ユーザー情報の取得に失敗しました');
    // }
    // await supabase.auth.admin.deleteUser(user.id);
  }
}
