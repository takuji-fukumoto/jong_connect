// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupMatchImpl _$$GroupMatchImplFromJson(Map<String, dynamic> json) =>
    _$GroupMatchImpl(
      id: (json['id'] as num).toInt(),
      matchType: $enumDecode(_$MatchTypeEnumMap, json['match_type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      groupId: (json['group_id'] as num).toInt(),
      createdBy: json['created_by'] as String,
      results: (json['group_match_results'] as List<dynamic>?)
          ?.map((e) => GroupMatchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupMatchImplToJson(_$GroupMatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_type': _$MatchTypeEnumMap[instance.matchType]!,
      'created_at': instance.createdAt.toIso8601String(),
      'group_id': instance.groupId,
      'created_by': instance.createdBy,
      'group_match_results': instance.results?.map((e) => e.toJson()).toList(),
    };

const _$MatchTypeEnumMap = {
  MatchType.four: 'four',
  MatchType.three: 'three',
};
