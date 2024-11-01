import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/domain/provider/friend_requests_waiting_for_approval.dart';
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

  /// フレンドIDを入力した場合はすぐにフレンド関係にする
  Future<void> makeFriendFromFriendId(String hashedFriendId) async {
    // TODO: 既にフレンド関係の場合例外吐く

    final friendId = hashids.decode(hashedFriendId).first;
    final targetUser =
        await _ref.read(appUserRepositoryProvider).fetchFromFriendId(friendId);
    // ユーザーがいない場合は例外返す
    if (targetUser == null) {
      throw Exception('存在しないフレンドIDです');
    }

    await _ref.read(friendsRepositoryProvider).makeFriend(targetUser);
    _ref.invalidate(currentFriendsProvider);
  }

  /// 間接的にユーザーを知った場合は一度フレンド申請を挟む（例： ユーザー詳細ページからともだち追加する場合など）
  Future<void> sendFriendRequest(AppUser targetUser) async {
    // FIXME: 既にフレンド関係の場合例外吐く

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
  }

  Future<void> rejectFriendRequest(int friendRequestId) async {
    await _ref
        .read(friendsRepositoryProvider)
        .rejectFriendRequest(friendRequestId);
    _ref.invalidate(friendRequestsWaitingForApprovalProvider);
  }

  Future<void> removeFriend(AppUser targetUser) async {
    await _ref.read(friendsRepositoryProvider).removeFriend(targetUser);
    _ref.invalidate(currentFriendsProvider);
  }
}
