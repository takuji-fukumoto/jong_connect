import 'dart:math';

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
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'groups') Group? group,
    @JsonKey(name: 'users') AppUser? createdBy,
    @JsonKey(name: 'end_at') DateTime? endAt,
    @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results,
  }) = _GroupMatch;

  factory GroupMatch.fromJson(Map<String, dynamic> json) =>
      _$GroupMatchFromJson(json);

  bool get isFinish {
    return endAt != null;
  }

  /// ユーザーID => トータルスコア
  Map<String, int> get totalPointsPerUser {
    if (results == null || results!.isEmpty) {
      return {};
    }
    Map<String, int> totalResults = {};

    for (var result in results!) {
      var userKey = result.userId!;
      totalResults[userKey] = (totalResults[userKey] ?? 0) + result.totalPoints;
    }

    return totalResults;
  }

  /// ユーザーID -> ラウンド別ポイント
  Map<String, List<int?>> get pointsPerRound {
    if (results == null || results!.isEmpty) {
      return {};
    }

    var playerKeys = results!.map<String>((result) => result.userId!).toSet();
    var totalPoints = <String, List<int?>>{};

    // 初期化
    for (var key in playerKeys) {
      totalPoints[key] = List.generate(maxRounds, (i) => null);
    }

    // 順にtotal_pointをセット
    for (var result in results!) {
      totalPoints[result.userId!]?[result.matchOrder - 1] ??=
          result.totalPoints;
    }

    return totalPoints;
  }

  int get maxRounds {
    if (results == null || results!.isEmpty) {
      return 0;
    }
    var matchOrders = results!.map<int>((result) => result.matchOrder).toSet();
    return matchOrders.reduce(max);
  }

  /// 参加ユーザー（重複なし）
  List<AppUser> get joinUsers {
    if (results == null || results!.isEmpty) {
      return [];
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
