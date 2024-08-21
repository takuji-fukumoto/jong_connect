import '../domain/model/app_user.dart';

class AppUserRepository {
  Future<AppUser?> get(String uuid) async {
    throw UnimplementedError();
  }

  Future<void> put(AppUser user) async {
    throw UnimplementedError();
  }

  Future<bool> existsFriendId(String friendId) async {
    throw UnimplementedError();
  }
}
