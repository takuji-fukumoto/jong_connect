import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/constants.dart';
import 'group_match_result.dart';

part 'group_match.freezed.dart';

part 'group_match.g.dart';

@freezed
class GroupMatch with _$GroupMatch {
  const GroupMatch._();

  @JsonSerializable(explicitToJson: true)
  const factory GroupMatch({
    required int id,
    @JsonKey(name: 'match_type') required MatchType matchType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results,
  }) = _GroupMatch;

  factory GroupMatch.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchFromJson(json);
}
