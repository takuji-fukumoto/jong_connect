import 'package:jong_connect/domain/model/game_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'game_config_repository_impl.dart';

part 'game_config_repository.g.dart';

@riverpod
GameConfigRepository gameConfigRepository(GameConfigRepositoryRef ref) =>
    GameConfigRepositoryImpl(ref);

class GameConfigRepository {
  Future<GameConfig> get() async {
    throw UnimplementedError();
  }

  Future<GameConfig> update(GameConfig input) async {
    throw UnimplementedError();
  }
}
