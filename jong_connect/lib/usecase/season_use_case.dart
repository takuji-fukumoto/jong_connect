import 'dart:async';

import 'package:jong_connect/data/seasons_repository.dart';
import 'package:jong_connect/domain/provider/group_seasons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jong_connect/domain/model/season.dart';

part 'season_use_case.g.dart';

@riverpod
SeasonUseCase seasonUseCase(SeasonUseCaseRef ref) => SeasonUseCase(ref);

class SeasonUseCase {
  final SeasonUseCaseRef _ref;

  SeasonUseCase(this._ref);

  Future<void> createGroupSeason(
      {required String name,
      required String description,
      required int groupId}) async {
    await _ref
        .read(seasonsRepositoryProvider)
        .create(name, description, groupId);
    _ref.invalidate(groupSeasonsProvider(groupId: groupId));
  }

  Future<void> updateSeason(Season newSeason) async {
    await _ref.read(seasonsRepositoryProvider).update(newSeason);
    _ref.invalidate(groupSeasonsProvider(groupId: newSeason.groupId));
  }

  Future<void> deleteSeason(int seasonId) async {
    await _ref.read(seasonsRepositoryProvider).delete(seasonId);
    _ref.invalidate(groupSeasonsProvider);
  }
}
