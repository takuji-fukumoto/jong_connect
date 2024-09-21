import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_icon.freezed.dart';

part 'group_icon.g.dart';

@freezed
class GroupIcon with _$GroupIcon {
  const factory GroupIcon({
    required int id,
    required String url,
  }) = _GroupIcon;

  factory GroupIcon.fromJson(Map<String, dynamic> json) =>
      _$GroupIconFromJson(json);
}
