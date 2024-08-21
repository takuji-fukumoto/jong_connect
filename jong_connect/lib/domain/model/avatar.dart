import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar.freezed.dart';

part 'avatar.g.dart';

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    required int id,
    required String url,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
