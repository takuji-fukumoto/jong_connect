import 'dart:async';

import 'package:jong_connect/data/app_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';
import '../util/routing_path.dart';

part 'user_auth_use_case.g.dart';

@riverpod
UserAuthUseCase userAuthUseCase(UserAuthUseCaseRef ref) => UserAuthUseCase(ref);

class UserAuthUseCase {
  final UserAuthUseCaseRef _ref;

  const UserAuthUseCase(this._ref);

  // FIXME: 全体的にsupabaseに依存しているのでrepositoryに移したほうがいいかも
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
    // MEMO: アプリとして展開する場合はここで向き先を変える
    return await supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: '$domainProduction/#/${RoutingPath.profile}',
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<void> deactivate() async {
    await _ref.read(appUserRepositoryProvider).deactivate();
    await signOut();
  }
}
