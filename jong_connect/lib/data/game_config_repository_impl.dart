import 'package:jong_connect/data/game_config_repository.dart';
import '../domain/model/game_config.dart';
import '../util/constants.dart';

class GameConfigRepositoryImpl implements GameConfigRepository {
  @override
  Future<GameConfig> get(String userId) async {
    final json = await supabase
        .from('game_configs')
        .select()
        .eq('user_id', userId)
        .limit(1);

    return json
        .map<GameConfig>((result) => GameConfig.fromJson(result))
        .toList()
        .first;
  }

  @override
  Future<GameConfig> update(GameConfig input) async {
    var json = await supabase
        .from('game_configs')
        .update({
          'initial_starting_point': input.initialStartingPoint,
          'settlement_score': input.settlementScore,
          'position_points': input.positionPoints,
        })
        .eq('user_id', input.userId)
        .select();

    return json
        .map<GameConfig>((result) => GameConfig.fromJson(result))
        .toList()
        .first;
  }
}
