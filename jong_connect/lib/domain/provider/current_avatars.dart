import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/avatars_repository.dart';
import '../model/avatar.dart';

part 'current_avatars.g.dart';

@Riverpod(keepAlive: true)
Future<List<Avatar>> currentAvatars(CurrentAvatarsRef ref) async {
  return await ref.read(avatarsRepositoryProvider).get();
}
