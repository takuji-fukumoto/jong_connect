import 'package:jong_connect/data/game_config_repository.dart';
import 'package:jong_connect/domain/provider/current_user.dart';

import '../domain/model/app_user.dart';
import '../domain/model/game_config.dart';
import '../util/constants.dart';

class GameConfigRepositoryImpl implements GameConfigRepository {
  final GameConfigRepositoryRef _ref;

  GameConfigRepositoryImpl(this._ref);

  @override
  Future<GameConfig> get() async {
    final user = await getCurrentUser();

    final json = await supabase
        .from('game_configs')
        .select()
        .eq('user_id', user.id)
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
        .update(input.toJson())
        .eq('user_id', input.userId)
        .select();

    return json
        .map<GameConfig>((result) => GameConfig.fromJson(result))
        .toList()
        .first;
  }

  Future<AppUser> getCurrentUser() async {
    final user = await _ref.read(currentUserProvider.future);

    if (user == null) {
      throw Exception('ログインしてください');
    }

    return user;
  }
}
