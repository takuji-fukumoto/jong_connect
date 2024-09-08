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
      createdAt: DateTime.parse(json['created_at'] as String),
      userName: json['user_name'] as String,
      groupMatch: json['group_matches'] == null
          ? null
          : GroupMatch.fromJson(json['group_matches'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
      user: json['users'] == null
          ? null
          : AppUser.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupMatchResultImplToJson(
        _$GroupMatchResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'rank': instance.rank,
      'total_points': instance.totalPoints,
      'match_order': instance.matchOrder,
      'created_at': instance.createdAt.toIso8601String(),
      'user_name': instance.userName,
      'group_matches': instance.groupMatch,
      'user_id': instance.userId,
      'users': instance.user,
    };
