// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_user_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputUserScoreImpl _$$InputUserScoreImplFromJson(Map<String, dynamic> json) =>
    _$InputUserScoreImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      score: (json['score'] as num).toInt(),
      seatingOrder: (json['seatingOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$InputUserScoreImplToJson(
        _$InputUserScoreImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'score': instance.score,
      'seatingOrder': instance.seatingOrder,
    };
