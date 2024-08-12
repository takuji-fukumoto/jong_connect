import 'dart:async';

import 'package:jong_connect/domain/provider/user_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/constants.dart';
import '../model/app_user.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
Future<AppUser?> currentUser(CurrentUserRef ref) async {
  final session = ref.watch(userSessionProvider);
  if(session == null){
    return null;
  }

  final user = await supabase
      .from('users')
      .select('id,name,profile,avatar_url')
      .eq('id', session.user.id).limit(1);

  return AppUser.fromJson(user.first);
}