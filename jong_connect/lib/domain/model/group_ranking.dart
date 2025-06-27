import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_ranking_user.dart';

part 'group_ranking.freezed.dart';

part 'group_ranking.g.dart';

@freezed
class GroupRanking with _$GroupRanking {
  const GroupRanking._();

  @JsonSerializable(explicitToJson: true)
  const factory GroupRanking({
    @JsonKey(name: 'ranking_items')
    required List<GroupRankingUser> rankingUsers,
  }) = _GroupRanking;

  factory GroupRanking.fromJson(Map<String, dynamic> json) =>
      _$GroupRankingFromJson(json);

  factory GroupRanking.fromRankingUsers(List<GroupRankingUser> users) =>
      GroupRanking(rankingUsers: users);

  List<GroupRankingUser> totalScoreRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => b.totalScore.compareTo(a.totalScore));
    return ranking;
  }

  List<GroupRankingUser> averageRankRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => b.averageRank.compareTo(a.averageRank));
    return ranking;
  }

  List<GroupRankingUser> totalGamesRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => b.totalGames.compareTo(a.totalGames));
    return ranking;
  }
}
