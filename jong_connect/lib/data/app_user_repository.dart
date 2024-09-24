import '../domain/model/app_user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_user_repository_impl.dart';

part 'app_user_repository.g.dart';

@riverpod
AppUserRepository appUserRepository(AppUserRepositoryRef ref) =>
    AppUserRepositoryImpl();

class AppUserRepository {
  Future<AppUser?> fetch(String uuid) async {
    throw UnimplementedError();
  }

  Future<AppUser?> fetchFromFriendId(int friendId) async {
    throw UnimplementedError();
  }

  Future<void> update(AppUser user) async {
    throw UnimplementedError();
  }

  Future<void> deactivate() async {
    throw UnimplementedError();
  }

// FIXME: auth系の処理はusecaseの依存度が高いのでここに持っていくかauth用のrepositoryを用意する
}
