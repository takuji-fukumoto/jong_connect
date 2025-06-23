import 'dart:async';

import 'package:jong_connect/data/seasons_repository.dart';
import 'package:jong_connect/domain/model/season.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_seasons.g.dart';

@riverpod
Future<List<Season>> groupSeasons(GroupSeasonsRef ref,
    {required int groupId}) async {
  return await ref.watch(seasonsRepositoryProvider).getGroupSeasons(groupId);
}
