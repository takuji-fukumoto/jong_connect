import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_ranking_user.freezed.dart';

part 'group_ranking_user.g.dart';

@freezed
class GroupRankingUser with _$GroupRankingUser {
  const GroupRankingUser._();

  @JsonSerializable(explicitToJson: true)
  const factory GroupRankingUser({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'total_points') required int totalPoints,
    @JsonKey(name: 'average_rank') required double averageRank,
    @JsonKey(name: 'total_games') required int totalGames,
  }) = _GroupRankingUser;

  factory GroupRankingUser.fromJson(Map<String, dynamic> json) =>
      _$GroupRankingUserFromJson(json);

  String get totalPointsString => totalPoints.toString();

  String get totalGamesString => totalGames.toString();

  String get averageRankString => averageRank.toStringAsFixed(2);
}
