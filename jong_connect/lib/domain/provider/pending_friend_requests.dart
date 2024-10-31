import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/model/user_friend_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/constants.dart';

part 'pending_friend_requests.g.dart';

@riverpod
Future<List<UserFriendRequest>> pendingFriendRequests(
    PendingFriendRequestsRef ref) async {
  return await ref
      .watch(friendsRepositoryProvider)
      .fetchFriendRequests(FriendRequestStatus.pending);
}
