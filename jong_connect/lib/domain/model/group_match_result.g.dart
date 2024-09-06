// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupMatchResultImpl _$$GroupMatchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupMatchResultImpl(
      id: (json['id'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      totalPoints: (json['total_points'] as num).toInt(),
      matchOrder: (json['match_order'] as num).toInt(),
      groupMatchId: (json['group_match_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$GroupMatchResultImplToJson(
        _$GroupMatchResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'rank': instance.rank,
      'total_points': instance.totalPoints,
      'match_order': instance.matchOrder,
      'group_match_id': instance.groupMatchId,
      'created_at': instance.createdAt.toIso8601String(),
      'user_id': instance.userId,
    };
