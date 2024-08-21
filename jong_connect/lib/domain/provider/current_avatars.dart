import 'dart:async';

import 'package:jong_connect/data/avatars_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/avatar.dart';

part 'current_avatars.g.dart';

@Riverpod(keepAlive: true)
Future<List<Avatar>> currentAvatars(CurrentAvatarsRef ref) async {
  return await ref.read(avatarsRepositoryImplProvider).get();
}
