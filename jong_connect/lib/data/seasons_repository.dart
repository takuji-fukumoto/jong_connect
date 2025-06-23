import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/season.dart';
import 'seasons_repository_impl.dart';

part 'seasons_repository.g.dart';

@riverpod
SeasonsRepository seasonsRepository(SeasonsRepositoryRef ref) =>
    SeasonsRepositoryImpl();

class SeasonsRepository {
  Future<List<Season>> getGroupSeasons(int groupId) async {
    throw UnimplementedError();
  }

  Future<Season?> findById(int seasonId) async {
    throw UnimplementedError();
  }

  Future<void> create(String name, String description, int groupId) async {
    throw UnimplementedError();
  }

  Future<void> update(Season season) async {
    throw UnimplementedError();
  }

  Future<void> delete(int seasonId) async {
    throw UnimplementedError();
  }
}
