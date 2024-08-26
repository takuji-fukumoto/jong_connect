import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/app_user_repository.dart';
import '../domain/model/app_user.dart';

part 'request_friend_use_case.g.dart';

@riverpod
RequestFriendUseCase requestFriendUseCase(RequestFriendUseCaseRef ref) =>
    RequestFriendUseCase(ref);

class RequestFriendUseCase {
  final RequestFriendUseCaseRef _ref;

  RequestFriendUseCase(this._ref);

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
  Future<void> sendRequest(String hashedFriendId) async {
    // TODO: 既にフレンド関係の場合例外吐く

    final friendId = hashids.decode(hashedFriendId).first;
    final targetUser =
        await _ref.read(appUserRepositoryProvider).fetchFromFriendId(friendId);
    // ユーザーがいない場合は例外返す
    if (targetUser == null) {
      throw Exception('存在しないフレンドIDです');
    }

    await _ref
        .read(friendsRepositoryProvider)
        .sendFriendRequestsFromFriendId(friendId);
  }

  Future<void> acceptRequest(AppUser requestedUser) async {
    await _ref
        .read(friendsRepositoryProvider)
        .acceptFriendRequest(requestedUser);
    _ref.invalidate(currentFriendsProvider);
  }

// TODO: リクエスト拒否のメソッド追加
}
