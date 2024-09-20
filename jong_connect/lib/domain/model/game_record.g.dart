// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRecordImpl _$$GameRecordImplFromJson(Map<String, dynamic> json) =>
    _$GameRecordImpl(
      type: $enumDecode(_$MatchTypeEnumMap, json['type']),
      totalGames: (json['totalGames'] as num).toInt(),
      averageRank: (json['averageRank'] as num?)?.toDouble(),
      topTwoRate: (json['topTwoRate'] as num?)?.toDouble(),
      bustingRate: (json['bustingRate'] as num?)?.toDouble(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      averagePoints: (json['averagePoints'] as num?)?.toDouble(),
      rankCounts: (json['rankCounts'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      recent20Ranks: (json['recent20Ranks'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$GameRecordImplToJson(_$GameRecordImpl instance) =>
    <String, dynamic>{
      'type': _$MatchTypeEnumMap[instance.type]!,
      'totalGames': instance.totalGames,
      'averageRank': instance.averageRank,
      'topTwoRate': instance.topTwoRate,
      'bustingRate': instance.bustingRate,
      'totalPoints': instance.totalPoints,
      'averagePoints': instance.averagePoints,
      'rankCounts': instance.rankCounts,
      'recent20Ranks': instance.recent20Ranks,
    };

const _$MatchTypeEnumMap = {
  MatchType.four: 'four',
  MatchType.three: 'three',
};
