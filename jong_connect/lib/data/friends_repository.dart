import 'package:jong_connect/domain/model/app_user.dart';
import 'package:jong_connect/domain/model/user_friend_request.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'friends_repository_impl.dart';

part 'friends_repository.g.dart';

@riverpod
FriendsRepository friendsRepository(FriendsRepositoryRef ref) =>
    FriendsRepositoryImpl(ref);

class FriendsRepository {
  Future<List<AppUser>> fetch() async {
    throw UnimplementedError();
  }

  Future<void> makeFriend(AppUser targetUser) async {
    throw UnimplementedError();
  }

  Future<List<UserFriendRequest>> fetchFriendRequestsInProgress() async {
    throw UnimplementedError();
  }

  Future<List<UserFriendRequest>>
      fetchFriendRequestsWaitingForApproval() async {
    throw UnimplementedError();
  }

  Stream<List<UserFriendRequest>> fetchPendingFriendRequestsStream() async* {
    throw UnimplementedError();
  }

  Future<void> sendFriendRequest(AppUser targetUser) async {
    throw UnimplementedError();
  }

  Future<bool> isRequestedFriendUser(int targetFriendId) async {
    throw UnimplementedError();
  }

  Future<void> deleteFriendRequest(int friendRequestId) async {
    throw UnimplementedError();
  }

  Future<void> acceptFriendRequest(int friendRequestId) async {
    throw UnimplementedError();
  }

  Future<void> rejectFriendRequest(int friendRequestId) async {
    throw UnimplementedError();
  }

  Future<void> removeFriend(AppUser targetUser) async {
    throw UnimplementedError();
  }
}
