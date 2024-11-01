import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/model/user_friend_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_requests_in_progress.g.dart';

@riverpod
Future<List<UserFriendRequest>> friendRequestsInProgress(
    FriendRequestsInProgressRef ref) async {
  return await ref
      .watch(friendsRepositoryProvider)
      .fetchFriendRequestsInProgress();
}
