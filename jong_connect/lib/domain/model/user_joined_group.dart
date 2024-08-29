import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/app_user.dart';

import 'group.dart';

part 'user_joined_group.freezed.dart';

part 'user_joined_group.g.dart';

@freezed
class UserJoinedGroup with _$UserJoinedGroup {
  const factory UserJoinedGroup({
    @JsonKey(name: 'users') AppUser? user,
    @JsonKey(name: 'groups') Group? group,
  }) = _UserJoinedGroup;

  factory UserJoinedGroup.fromJson(Map<String, dynamic> json) =>
      _$UserJoinedGroupFromJson(json);
}
