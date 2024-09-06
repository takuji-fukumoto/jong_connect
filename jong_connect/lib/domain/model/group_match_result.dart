import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_match_result.freezed.dart';

part 'group_match_result.g.dart';

@freezed
class GroupMatchResult with _$GroupMatchResult {
  const factory GroupMatchResult({
    required int id,
    required int score,
    required int rank,
    @JsonKey(name: 'total_points') required int totalPoints,
    @JsonKey(name: 'match_order') required int matchOrder,
    @JsonKey(name: 'group_match_id') required int groupMatchId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'user_id') String? userId,
  }) = _GroupMatchResult;

  factory GroupMatchResult.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchResultFromJson(json);
}
