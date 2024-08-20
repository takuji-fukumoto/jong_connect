import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';

part 'user_auth_use_case.g.dart';

@riverpod
UserAuthUseCase userAuthUseCase(UserAuthUseCaseRef ref) => UserAuthUseCase();

class UserAuthUseCase {
  Future<AuthResponse> signInWithPassword(String email, String password) async {
    return await supabase.auth
        .signInWithPassword(password: password, email: email);
  }

  Future<AuthResponse> signInAnonymously() async {
    return await supabase.auth.signInAnonymously();
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await supabase.auth.signUp(password: password);
  }

  void signOut() async {
    await supabase.auth.signOut();
  }
}
