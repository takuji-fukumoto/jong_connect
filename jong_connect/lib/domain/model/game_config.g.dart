// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameConfigImpl _$$GameConfigImplFromJson(Map<String, dynamic> json) =>
    _$GameConfigImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      initialStartingPoint: (json['initial_starting_point'] as num).toInt(),
      settlementScore: (json['settlement_score'] as num).toInt(),
      positionPoints: (json['position_points'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      initialStartingPointForThree:
          (json['initial_starting_point_for_three'] as num).toInt(),
      settlementScoreForThree:
          (json['settlement_score_for_three'] as num).toInt(),
      positionPointsForThree:
          (json['position_points_for_three'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$$GameConfigImplToJson(_$GameConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'initial_starting_point': instance.initialStartingPoint,
      'settlement_score': instance.settlementScore,
      'position_points': instance.positionPoints,
      'initial_starting_point_for_three': instance.initialStartingPointForThree,
      'settlement_score_for_three': instance.settlementScoreForThree,
      'position_points_for_three': instance.positionPointsForThree,
    };
