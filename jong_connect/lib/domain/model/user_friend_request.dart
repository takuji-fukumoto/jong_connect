import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_friend_request.freezed.dart';
part 'user_friend_request.g.dart';

@freezed
class UserFriendRequest with _$UserFriendRequest {

  const factory UserFriendRequest({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'target_user_id') required String targetUserId,
    required String status,
  }) = _UserFriendRequest;

  factory UserFriendRequest.fromJson(Map<String, dynamic> json) => _$UserFriendRequestFromJson(json);
}