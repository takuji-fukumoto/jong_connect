import 'dart:async';

import 'package:jong_connect/data/group_rankings_repository.dart';
import 'package:jong_connect/domain/model/group_ranking.dart';
import 'package:jong_connect/util/extensions/cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/constants.dart';

part 'group_season_ranking.g.dart';

@riverpod
Future<GroupRanking> groupSeasonRanking(GroupSeasonRankingRef ref,
    {required int groupId,
    required int seasonId,
    required MatchType matchType}) async {
  // 5分間キャッシュ
  ref.cacheFor(const Duration(minutes: 5));

  return await ref
      .read(groupRankingsRepositoryProvider)
      .getSeasonRanking(groupId, seasonId, matchType);
}
