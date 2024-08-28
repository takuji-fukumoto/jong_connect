import 'dart:async';

import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/provider/user_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_user.dart';

part 'current_friends.g.dart';

// TODO: stream providerにしてリアルタイム取得する
@Riverpod(keepAlive: true)
Future<List<AppUser>> currentFriends(CurrentFriendsRef ref) async {
  final session = ref.watch(userSessionProvider);
  if (session == null) {
    return [];
  }

  print('current_friends更新');
  final friends = await ref.read(friendsRepositoryProvider).fetch();

  return friends;
}
