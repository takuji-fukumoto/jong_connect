import 'dart:async';

import 'package:jong_connect/data/group_rankings_repository.dart';
import 'package:jong_connect/domain/model/group_ranking.dart';
import 'package:jong_connect/util/extensions/cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_total_ranking.g.dart';

@riverpod
Future<GroupRanking> groupTotalRanking(GroupTotalRankingRef ref,
    {required int groupId}) async {
  // 5分間キャッシュ
  ref.cacheFor(const Duration(minutes: 5));

  return await ref
      .read(groupRankingsRepositoryProvider)
      .getTotalRanking(groupId);
}
