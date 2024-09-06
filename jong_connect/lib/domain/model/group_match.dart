import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/app_user.dart';

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
    @JsonKey(name: 'users') AppUser? createdBy,
    @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results,
  }) = _GroupMatch;

  factory GroupMatch.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchFromJson(json);

  // ユーザー名 => トータルスコア
  Map<String, int>? get totalResultsPerUser {
    if (results == null) {
      return null;
    }
    Map<String, int> totalResults = {};
    Map<String, String> deactivatedUserNames = {};

    for (var result in results!) {
      var userName = '';

      // 退会済みのユーザーは名前を伏せる（退会済みユーザー1,2,3...）
      if (result.userId == null) {
        if (!deactivatedUserNames.containsKey(result.userName)) {
          deactivatedUserNames[result.userName] =
              '退会済みユーザー${deactivatedUserNames.length + 1}';
        }

        userName = deactivatedUserNames[result.userName]!;
      } else {
        userName = result.userName;
      }

      totalResults[userName] =
          (totalResults[userName] ?? 0) + result.totalPoints;
    }

    return totalResults;
  }
}
