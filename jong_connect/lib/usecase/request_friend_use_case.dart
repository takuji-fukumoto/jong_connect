import 'dart:async';

import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/app_user_repository.dart';

part 'request_friend_use_case.g.dart';

@riverpod
RequestFriendUseCase requestFriendUseCase(RequestFriendUseCaseRef ref) =>
    RequestFriendUseCase(ref);

class RequestFriendUseCase {
  late RequestFriendUseCaseRef _ref;

  RequestFriendUseCase(this._ref);

  Future<void> sendRequest(String hashedFriendId) async {
    // TODO: ハッシュでコード
    final friendId = hashids.decode(hashedFriendId);
    // TODO: フレンドIDでユーザー検索
    final targetUser = await _ref
        .read(appUserRepositoryProvider)
        .fetchFromFriendId(friendId.first);
    // TODO: ユーザーがいない場合は例外返す
    if (targetUser == null) {
      throw Exception('対象ユーザーが存在しません');
    }

    // TODO: 該当ユーザーIDでfriend_requestレコード生成
    final user = await _ref.read(currentUserProvider.future);
  }

// TODO: リクエスト許可のメソッド追加

// TODO: リクエスト拒否のメソッド追加
}
