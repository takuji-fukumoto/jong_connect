import 'dart:async';

import 'package:jong_connect/domain/provider/user_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/app_user_repository.dart';
import '../model/app_user.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
Future<AppUser?> currentUser(CurrentUserRef ref) async {
  final session = ref.watch(userSessionProvider);
  if (session == null) {
    return null;
  }

  return await ref.read(appUserRepositoryProvider).fetch(session.user.id);
}
