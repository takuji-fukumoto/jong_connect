import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/constants.dart';

final authStateNotifierProvider = Provider((ref) {
  return AuthStateNotifier();
});

// MEMO: go_routerのrefreshListenableに対応するためやむなくChangeNotifierを利用
class AuthStateNotifier extends ChangeNotifier {
  AuthState? authState;

  AuthStateNotifier() {
    supabase.auth.onAuthStateChange.listen(_updateState);
  }

  void _updateState(AuthState state) {
    print('state更新: ${state.session?.user.id}');
    authState = state;
    notifyListeners();
  }
}
