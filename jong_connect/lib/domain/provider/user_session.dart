import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';

part 'user_session.g.dart';

@Riverpod(keepAlive: true)
class UserSession extends _$UserSession {
  @override
  Session? build() {
    initListener();

    return supabase.auth.currentSession;
  }

  initListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      state = data.session;
    });
  }
}
