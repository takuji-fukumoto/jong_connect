import 'dart:async';

import 'package:jong_connect/data/seasons_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_season_use_case.g.dart';

@riverpod
CreateSeasonUseCase createSeasonUseCase(CreateSeasonUseCaseRef ref) =>
    CreateSeasonUseCase(ref);

class CreateSeasonUseCase {
  final CreateSeasonUseCaseRef _ref;

  CreateSeasonUseCase(this._ref);

  Future<void> execute(
      {required String name,
      required String description,
      required int groupId}) async {
    return await _ref
        .read(seasonsRepositoryProvider)
        .create(name, description, groupId);
  }
}
