import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_match.dart';

import 'app_user.dart';

part 'group_match_result.freezed.dart';

part 'group_match_result.g.dart';

@freezed
class GroupMatchResult with _$GroupMatchResult {
  const GroupMatchResult._();

  const factory GroupMatchResult({
    required int id,
    required int score,
    required int rank,
    @JsonKey(name: 'total_points') required int totalPoints,
    @JsonKey(name: 'match_order') required int matchOrder,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'user_name') required String userName,
    @JsonKey(name: 'group_match_id') int? groupMatchId,
    @JsonKey(name: 'group_matches') GroupMatch? groupMatch,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'users') AppUser? user,
  }) = _GroupMatchResult;

  factory GroupMatchResult.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchResultFromJson(json);

  String get userDisplayName {
    return user != null
        ? user!.name
        : userId != null
            ? userName
            : '退会済みユーザー';
  }
}
