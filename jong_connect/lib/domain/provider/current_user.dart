import 'dart:async';

import 'package:jong_connect/data/app_user_repository_impl.dart';
import 'package:jong_connect/domain/provider/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_user.dart';

part 'current_user.g.dart';

// FIXME: ユーザー情報が更新されない場合は、usersテーブルをrealtime有効にしてlisten, stream providerとして提供したほうがいいかも
@Riverpod(keepAlive: true)
Future<AppUser?> currentUser(CurrentUserRef ref) async {
  final session = ref.watch(authStateNotifier).authState?.session;
  if (session == null) {
    return null;
  }

  print('current_user更新');
  return await ref.read(appUserRepositoryImplProvider).get(session.user.id);
}
