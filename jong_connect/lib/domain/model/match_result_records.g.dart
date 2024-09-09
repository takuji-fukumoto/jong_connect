// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_result_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchResultRecordsImpl _$$MatchResultRecordsImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchResultRecordsImpl(
      groupId: (json['groupId'] as num).toInt(),
      matchType: $enumDecode(_$MatchTypeEnumMap, json['matchType']),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => GroupMatchResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MatchResultRecordsImplToJson(
        _$MatchResultRecordsImpl instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'matchType': _$MatchTypeEnumMap[instance.matchType]!,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

const _$MatchTypeEnumMap = {
  MatchType.four: 'four',
  MatchType.three: 'three',
};
