import '../domain/model/avatar.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'avatars_repository_impl.dart';

part 'avatars_repository.g.dart';

@riverpod
AvatarsRepository avatarsRepository(AvatarsRepositoryRef ref) =>
    AvatarsRepositoryImpl();

class AvatarsRepository {
  Future<List<Avatar>> get() async {
    throw UnimplementedError();
  }
}
