import 'dart:async';

import 'package:jong_connect/data/seasons_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/season.dart';

part 'season_details.g.dart';

@riverpod
Future<Season?> seasonDetails(SeasonDetailsRef ref,
    {required int seasonId}) async {
  return await ref.watch(seasonsRepositoryProvider).findById(seasonId);
}
