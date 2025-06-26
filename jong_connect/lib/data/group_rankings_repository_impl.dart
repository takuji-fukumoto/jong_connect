import 'package:jong_connect/data/group_rankings_repository.dart';
import 'package:jong_connect/domain/model/group_ranking_item.dart';
import '../domain/model/group_ranking.dart';
import '../util/constants.dart';

class GroupRankingsRepositoryImpl implements GroupRankingsRepository {
  @override
  Future<GroupRanking> getTotalRanking(int groupId) async {
    var rankingItems = await supabase.rpc('get_group_ranking', params: {
      'group_id': groupId,
    });

    var items = rankingItems
        .map<GroupRankingItem>((json) => GroupRankingItem.fromJson(json))
        .toList();

    return GroupRanking.fromRankingItems(items);
  }

  @override
  Future<GroupRanking> getSeasonRanking(int groupId, int seasonId) async {
    var rankingItems = await supabase.rpc('get_group_season_ranking', params: {
      'group_id': groupId,
      'season_id': seasonId,
    });

    var items = rankingItems
        .map<GroupRankingItem>((json) => GroupRankingItem.fromJson(json))
        .toList();

    return GroupRanking.fromRankingItems(items);
  }
}
