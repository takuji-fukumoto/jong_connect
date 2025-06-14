import 'dart:async';

import 'package:jong_connect/data/game_config_repository.dart';
import 'package:jong_connect/domain/provider/game_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_game_config_use_case.g.dart';

@riverpod
EditGameConfigUseCase editGameConfigUseCase(EditGameConfigUseCaseRef ref) =>
    EditGameConfigUseCase(ref);

class EditGameConfigUseCase {
  final EditGameConfigUseCaseRef _ref;

  EditGameConfigUseCase(this._ref);

  Future<void> apply({
    required int initialStartingPoint,
    required int settlementScore,
    required List<int> positionPoints,
    required int initialStartingPointForThree,
    required int settlementScoreForThree,
    required List<int> positionPointsForThree,
  }) async {
    final currentConfig = await _ref.read(gameConfigProvider.future);
    final fixedConfig = currentConfig!.copyWith(
      initialStartingPoint: initialStartingPoint,
      settlementScore: settlementScore,
      positionPoints: positionPoints,
      initialStartingPointForThree: initialStartingPointForThree,
      settlementScoreForThree: settlementScoreForThree,
      positionPointsForThree: positionPointsForThree,
    );

    await _ref.read(gameConfigRepositoryProvider).update(fixedConfig);
    _ref.invalidate(gameConfigProvider);
  }
}
