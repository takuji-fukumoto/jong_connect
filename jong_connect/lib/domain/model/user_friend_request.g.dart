// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFriendRequestImpl _$$UserFriendRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserFriendRequestImpl(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      targetUserId: json['target_user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      status: $enumDecode(_$FriendRequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UserFriendRequestImplToJson(
        _$UserFriendRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'target_user_id': instance.targetUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'status': _$FriendRequestStatusEnumMap[instance.status]!,
    };

const _$FriendRequestStatusEnumMap = {
  FriendRequestStatus.pending: 'pending',
  FriendRequestStatus.accepted: 'accepted',
  FriendRequestStatus.rejected: 'rejected',
};
