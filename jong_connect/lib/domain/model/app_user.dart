import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/constants.dart';

part 'app_user.freezed.dart';

part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser(
      {required String id,
      required String name,
      required String profile,
      @JsonKey(name: 'avatar_url') required String avatarUrl,
      @JsonKey(name: 'friend_id') required int friendId,
      @Default("") String email}) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  String get hashedFriendId => hashids.encode(friendId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser && id == other.id && name == other.name;

  @override
  int get hashCode => id.hashCode;
}
