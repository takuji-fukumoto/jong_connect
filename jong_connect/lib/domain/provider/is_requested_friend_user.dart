import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_requested_friend_user.g.dart';

@riverpod
Future<bool> isRequestedFriendUser(
    IsRequestedFriendUserRef ref, int targetFriendId) async {
  return await ref
      .read(friendsRepositoryProvider)
      .isRequestedFriendUser(targetFriendId);
}
