import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';


class _AuthStateNotifier extends ValueNotifier<AuthState?> {
  _AuthStateNotifier() : super(null);
  void change(AuthState? v) => value = v;
}

final authStateNotifier = _AuthStateNotifier();

final authProvider = StreamProvider<AuthState>(
      (ref) {
    ref.listenSelf((_, v) => authStateNotifier.change(v.value));
    return supabase.auth.onAuthStateChange;
  },
);
