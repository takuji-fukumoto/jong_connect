import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group.dart';

part 'season.freezed.dart';

part 'season.g.dart';

@freezed
class Season with _$Season {
  @JsonSerializable(explicitToJson: true)
  const factory Season({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'group') Group? group,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
