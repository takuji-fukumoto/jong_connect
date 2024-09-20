import 'dart:async';

import 'package:jong_connect/data/group_match_results_repository.dart';
import 'package:jong_connect/domain/model/game_record.dart';
import 'package:jong_connect/util/extensions/cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/constants.dart';

part 'game_record.g.dart';

@riverpod
Future<GameRecord> gameRecord(GameRecordRef ref,
    {required String userId,
    required String matchTypeName,
    int? groupId}) async {
  // 5分間キャッシュ
  ref.cacheFor(const Duration(minutes: 5));

  final type = MatchType.values.byName(matchTypeName);
  if (groupId != null) {
    final results = await ref
        .read(groupMatchResultsRepositoryProvider)
        .getUserGroupResults(userId, type, groupId);
    return GameRecord.fromResults(type, results);
  }

  final results = await ref
      .read(groupMatchResultsRepositoryProvider)
      .getUserAllResults(userId, type);
  return GameRecord.fromResults(type, results);
}
