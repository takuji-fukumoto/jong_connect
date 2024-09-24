// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profile: json['profile'] as String,
      avatarUrl: json['avatar_url'] as String,
      friendId: (json['friend_id'] as num).toInt(),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      email: json['email'] as String? ?? "",
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile': instance.profile,
      'avatar_url': instance.avatarUrl,
      'friend_id': instance.friendId,
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'email': instance.email,
    };
