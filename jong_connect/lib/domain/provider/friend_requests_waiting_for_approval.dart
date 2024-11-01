import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/model/user_friend_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_requests_waiting_for_approval.g.dart';

@riverpod
Future<List<UserFriendRequest>> friendRequestsWaitingForApproval(
    FriendRequestsWaitingForApprovalRef ref) async {
  return await ref
      .watch(friendsRepositoryProvider)
      .fetchFriendRequestsWaitingForApproval();
}
