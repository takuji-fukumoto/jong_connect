import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_config.freezed.dart';

part 'game_config.g.dart';

@freezed
class GameConfig with _$GameConfig {
  const GameConfig._();

  const factory GameConfig({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'initial_starting_point') required int initialStartingPoint,
    @JsonKey(name: 'settlement_score') required int settlementScore,
    @JsonKey(name: 'position_points') required List<int> positionPoints,
  }) = _GameConfig;

  factory GameConfig.fromJson(Map<String, dynamic> json) =>
      _$GameConfigFromJson(json);
}
