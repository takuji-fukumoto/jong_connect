// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_ranking_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupRankingUserImpl _$$GroupRankingUserImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupRankingUserImpl(
      userId: json['user_id'] as String,
      totalPoints: (json['total_points'] as num).toInt(),
      averageRank: (json['average_rank'] as num).toDouble(),
      totalGames: (json['total_games'] as num).toInt(),
    );

Map<String, dynamic> _$$GroupRankingUserImplToJson(
        _$GroupRankingUserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'total_points': instance.totalPoints,
      'average_rank': instance.averageRank,
      'total_games': instance.totalGames,
    };
