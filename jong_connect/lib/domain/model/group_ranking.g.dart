// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupRankingImpl _$$GroupRankingImplFromJson(Map<String, dynamic> json) =>
    _$GroupRankingImpl(
      rankingItems: (json['ranking_items'] as List<dynamic>)
          .map((e) => GroupRankingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupRankingImplToJson(_$GroupRankingImpl instance) =>
    <String, dynamic>{
      'ranking_items': instance.rankingItems.map((e) => e.toJson()).toList(),
    };
