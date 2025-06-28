import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_ranking_user.dart';
import 'package:jong_connect/util/constants.dart';

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

  // 順位と成績（文字列）のセット
  List<({int rank, String score, String userId})> rankingFromCategory(
      GroupRankingCategory category) {
    switch (category) {
      case GroupRankingCategory.totalPoints:
        return totalPointsRanking();
      case GroupRankingCategory.averageRank:
        return averageRankRanking();
      case GroupRankingCategory.totalGames:
        return totalGamesRanking();
      default:
        return [];
    }
  }

  List<({int rank, String score, String userId})> totalPointsRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => b.totalPoints.compareTo(a.totalPoints));
    var totalScoreRanking =
        ranking.map((rankingUser) => rankingUser.totalPoints).toList();
    var fixedScoreRanking = _calculateRanks(totalScoreRanking);

    return List.generate(
        ranking.length,
        (i) => (
              rank: fixedScoreRanking[i].rank,
              score: ranking[i].totalPointsString,
              userId: ranking[i].userId,
            ));
  }

  List<({int rank, String score, String userId})> averageRankRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => a.averageRank.compareTo(b.averageRank));
    var avgRanking =
        ranking.map((rankingUser) => rankingUser.averageRank).toList();
    var fixedAvgRanking = _calculateRanks(avgRanking, ascending: true);

    return List.generate(
        ranking.length,
        (i) => (
              rank: fixedAvgRanking[i].rank,
              score: ranking[i].averageRankString,
              userId: ranking[i].userId,
            ));
  }

  List<({int rank, String score, String userId})> totalGamesRanking() {
    var ranking = [...rankingUsers];
    ranking.sort((a, b) => b.totalGames.compareTo(a.totalGames));
    var totalGamesRanking =
        ranking.map((rankingUser) => rankingUser.totalGames).toList();
    var fixedTotalGamesRanking = _calculateRanks(totalGamesRanking);

    return List.generate(
        ranking.length,
        (i) => (
              rank: fixedTotalGamesRanking[i].rank,
              score: ranking[i].totalGamesString,
              userId: ranking[i].userId,
            ));
  }

  List<({num score, int rank})> _calculateRanks(List<num> scores,
      {bool ascending = false}) {
    // スコアと元のインデックスを保持
    List<MapEntry<int, num>> indexedScores = scores.asMap().entries.toList();

    // ソート
    indexedScores.sort((a, b) =>
        ascending ? a.value.compareTo(b.value) : b.value.compareTo(a.value));

    List<int> ranks = List.filled(scores.length, 0);
    int rank = 1;

    for (int i = 0; i < indexedScores.length; i++) {
      if (i > 0 && indexedScores[i].value != indexedScores[i - 1].value) {
        rank = i + 1;
      }
      ranks[indexedScores[i].key] = rank;
    }

    // スコアと順位のレコードを返す
    return List.generate(
        scores.length, (i) => (score: scores[i], rank: ranks[i]));
  }
}
