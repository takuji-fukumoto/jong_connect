import 'package:jong_connect/data/group_rankings_repository.dart';
import 'package:jong_connect/domain/model/group_ranking_user.dart';
import '../domain/model/group_ranking.dart';
import '../util/constants.dart';

class GroupRankingsRepositoryImpl implements GroupRankingsRepository {
  @override
  Future<GroupRanking> getTotalRanking(int groupId, MatchType matchType) async {
    var rankingUsers = await supabase.rpc('get_group_ranking', params: {
      'target_group_id': groupId,
      'group_match_type': matchType.name,
    });

    var users = rankingUsers
        .map<GroupRankingUser>((json) => GroupRankingUser.fromJson(json))
        .toList();

    return GroupRanking.fromRankingUsers(users);
  }

  @override
  Future<GroupRanking> getSeasonRanking(
      int groupId, int seasonId, MatchType matchType) async {
    var rankingUsers = await supabase.rpc('get_group_season_ranking', params: {
      'target_group_id': groupId,
      'target_season_id': seasonId,
      'group_match_type': matchType.name,
    });

    var users = rankingUsers
        .map<GroupRankingUser>((json) => GroupRankingUser.fromJson(json))
        .toList();

    return GroupRanking.fromRankingUsers(users);
  }
}
