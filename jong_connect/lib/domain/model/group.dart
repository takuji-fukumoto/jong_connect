import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/user_joined_group.dart';
import 'package:jong_connect/domain/model/season.dart';

part 'group.freezed.dart';

part 'group.g.dart';

@freezed
class Group with _$Group {
  @JsonSerializable(explicitToJson: true)
  const factory Group({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'seasons') List<Season>? seasons,
    @JsonKey(name: 'user_joinned_groups') List<UserJoinedGroup>? joinedUsers,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
