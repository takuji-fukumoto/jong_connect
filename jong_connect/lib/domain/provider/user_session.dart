import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';

part 'user_session.g.dart';

// TODO: 不要であればgファイルと一緒に削除する
@Riverpod(keepAlive: true)
class UserSession extends _$UserSession {
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  Session? build() {
    initListener();

    return supabase.auth.currentSession;
  }

  initListener() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      state = data.session;
    });
  }

  Future<AuthResponse> loginWithPassword(String email, String password) async {
    return await supabase.auth
        .signInWithPassword(password: password, email: email);
  }

  logout() async {
    await supabase.auth.signOut();
  }

  dispose() {
    _authStateSubscription.cancel();
  }
}
