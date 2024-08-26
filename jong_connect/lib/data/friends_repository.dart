import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/app_user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'friends_repository_impl.dart';

part 'friends_repository.g.dart';

@riverpod
FriendsRepository friendsRepository(FriendsRepositoryRef ref) =>
    FriendsRepositoryImpl();

class FriendsRepository {
  Future<List<AppUser>> fetch() async {
    throw UnimplementedError();
  }

  Future<void> sendFriendRequestsFromFriendId(String friendId) async {
    throw UnimplementedError();
  }

  @override
  Future<void> makeFriends(AppUser requestedUser, AppUser targetUser) async {
    throw UnimplementedError();
  }
}
