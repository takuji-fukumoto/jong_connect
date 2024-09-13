import 'dart:async';

import 'package:jong_connect/data/game_config_repository.dart';
import 'package:jong_connect/domain/model/game_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_config.g.dart';

@Riverpod(keepAlive: true)
Future<GameConfig> gameConfig(GameConfigRef ref) async {
  return await ref.read(gameConfigRepositoryProvider).get();
}
