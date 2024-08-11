// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profile: json['profile'] as String,
      avatarUrl: json['avatar_url'] as String,
      email: json['email'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile': instance.profile,
      'avatar_url': instance.avatarUrl,
      'email': instance.email,
    };
