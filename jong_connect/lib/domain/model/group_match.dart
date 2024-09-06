import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/app_user.dart';

import '../../util/constants.dart';
import '../../util/expect.dart';
import 'group.dart';
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
    @JsonKey(name: 'groups') Group? group,
    @JsonKey(name: 'users') AppUser? createdBy,
    @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results,
  }) = _GroupMatch;

  factory GroupMatch.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchFromJson(json);

  /// ユーザー名 => トータルスコア
  Map<String, int>? get totalResultsPerUser {
    if (results == null || results!.isEmpty) {
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
        userName = result.user?.name ?? result.userName;
      }

      totalResults[userName] =
          (totalResults[userName] ?? 0) + result.totalPoints;
    }

    return totalResults;
  }

  /// 参加ユーザー（重複なし）
  List<AppUser>? get joinUsers {
    if (results == null || results!.isEmpty) {
      return null;
    }

    // 退会しているユーザーがいる場合仮のユーザーを追加
    var allUsers = results!
        .map<AppUser>((result) =>
            result.user ??
            AppUser(
                id: result.userName,
                name: result.userName,
                profile: '',
                avatarUrl: '',
                friendId: 0))
        .toList();
    return expect(allUsers, (AppUser element) => element.id);
  }
}
