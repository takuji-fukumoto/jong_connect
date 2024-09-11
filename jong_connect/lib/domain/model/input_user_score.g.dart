// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_user_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputUserScoreImpl _$$InputUserScoreImplFromJson(Map<String, dynamic> json) =>
    _$InputUserScoreImpl(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      score: (json['score'] as num).toInt(),
      seatingOrder: (json['seatingOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$InputUserScoreImplToJson(
        _$InputUserScoreImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'score': instance.score,
      'seatingOrder': instance.seatingOrder,
    };
