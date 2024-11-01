import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/util/constants.dart';

import 'app_user.dart';

part 'user_friend_request.freezed.dart';

part 'user_friend_request.g.dart';

@freezed
class UserFriendRequest with _$UserFriendRequest {
  const factory UserFriendRequest({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'friend_id') required int friendId,
    @JsonKey(name: 'user') AppUser? targetUser,
    required FriendRequestStatus status,
  }) = _UserFriendRequest;

  factory UserFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$UserFriendRequestFromJson(json);
}
