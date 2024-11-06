// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_group_match_players.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinedGroupMatchPlayersImpl _$$JoinedGroupMatchPlayersImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinedGroupMatchPlayersImpl(
      id: (json['id'] as num).toInt(),
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      groupMatch: json['group_match'] == null
          ? null
          : GroupMatch.fromJson(json['group_match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JoinedGroupMatchPlayersImplToJson(
        _$JoinedGroupMatchPlayersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'group_match': instance.groupMatch,
    };
