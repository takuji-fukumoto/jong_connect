import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/domain/provider/friend_requests_waiting_for_approval.dart';
import 'package:jong_connect/domain/provider/new_friend_request_subscription.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/app_user_repository.dart';
import '../domain/model/app_user.dart';

part 'friend_use_case.g.dart';

@riverpod
FriendUseCase friendUseCase(FriendUseCaseRef ref) => FriendUseCase(ref);

class FriendUseCase {
  final FriendUseCaseRef _ref;

  FriendUseCase(this._ref);

  Future<AppUser> findUserFromFriendId(String hashedFriendId) async {
    final friendId = hashids.decode(hashedFriendId).first;
    final targetUser =
        await _ref.read(appUserRepositoryProvider).fetchFromFriendId(friendId);
    // ユーザーがいない場合は例外返す
    if (targetUser == null) {
      throw Exception('存在しないフレンドIDです');
    }

    return targetUser;
  }

  Future<void> sendFriendRequest(AppUser targetUser) async {
    if (await _isAlreadyFriends(targetUser)) {
      throw Exception('既にフレンドになっています');
    }

    await _ref.read(friendsRepositoryProvider).sendFriendRequest(targetUser);
  }

  Future<void> deleteFriendRequest(int friendRequestId) async {
    await _ref
        .read(friendsRepositoryProvider)
        .deleteFriendRequest(friendRequestId);
  }

  Future<void> acceptFriendRequest(int friendRequestId) async {
    await _ref
        .read(friendsRepositoryProvider)
        .acceptFriendRequest(friendRequestId);
    _ref.invalidate(currentFriendsProvider);
    _ref.invalidate(friendRequestsWaitingForApprovalProvider);
    _ref.invalidate(newFriendRequestSubscriptionProvider);
  }

  Future<void> rejectFriendRequest(int friendRequestId) async {
    await _ref
        .read(friendsRepositoryProvider)
        .rejectFriendRequest(friendRequestId);
    _ref.invalidate(friendRequestsWaitingForApprovalProvider);
    _ref.invalidate(newFriendRequestSubscriptionProvider);
  }

  Future<void> removeFriend(AppUser targetUser) async {
    await _ref.read(friendsRepositoryProvider).removeFriend(targetUser);
    _ref.invalidate(currentFriendsProvider);
  }

  Future<bool> _isAlreadyFriends(AppUser user) async {
    final friends = await _ref.read(currentFriendsProvider.future);
    return friends.contains(user);
  }
}
