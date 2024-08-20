import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {

  const factory AppUser({
    required String id,
    required String name,
    required String profile,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @Default("") String email
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}