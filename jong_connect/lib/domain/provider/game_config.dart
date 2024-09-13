import 'dart:async';

import 'package:jong_connect/data/game_config_repository.dart';
import 'package:jong_connect/domain/model/game_config.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_config.g.dart';

@riverpod
Future<GameConfig?> gameConfig(GameConfigRef ref) async {
  final user = ref.watch(currentUserProvider);
  if (user.isLoading ||
      user.isReloading ||
      user.isRefreshing ||
      user.hasError) {
    return null;
  }

  if (user.value == null) {
    return null;
  }

  return await ref.read(gameConfigRepositoryProvider).get(user.value!.id);
}
