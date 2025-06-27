import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_ranking.dart';
import '../util/constants.dart';
import 'group_rankings_repository_impl.dart';

part 'group_rankings_repository.g.dart';

@riverpod
GroupRankingsRepository groupRankingsRepository(
        GroupRankingsRepositoryRef ref) =>
    GroupRankingsRepositoryImpl();

class GroupRankingsRepository {
  Future<GroupRanking> getTotalRanking(int groupId, MatchType matchType) async {
    throw UnimplementedError();
  }

  Future<GroupRanking> getSeasonRanking(
      int groupId, int seasonId, MatchType matchType) async {
    throw UnimplementedError();
  }
}
