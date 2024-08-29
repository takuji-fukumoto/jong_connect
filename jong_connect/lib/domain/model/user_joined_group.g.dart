// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_joined_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJoinedGroupImpl _$$UserJoinedGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$UserJoinedGroupImpl(
      user: json['users'] == null
          ? null
          : AppUser.fromJson(json['users'] as Map<String, dynamic>),
      group: json['groups'] == null
          ? null
          : Group.fromJson(json['groups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserJoinedGroupImplToJson(
        _$UserJoinedGroupImpl instance) =>
    <String, dynamic>{
      'users': instance.user,
      'groups': instance.group,
    };
