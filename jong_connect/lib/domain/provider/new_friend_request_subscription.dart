import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/model/user_friend_request.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_friend_request_subscription.g.dart';

@riverpod
Stream<List<UserFriendRequest>> newFriendRequestSubscription(
    NewFriendRequestSubscriptionRef ref) {
  var user = ref.watch(currentUserProvider);
  if (user.isLoading || user.value == null) {
    return Stream.value([]);
  }

  return ref
      .watch(friendsRepositoryProvider)
      .fetchPendingFriendRequestsStream(user.value!.friendId);
}
