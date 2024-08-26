import 'package:jong_connect/data/friends_repository.dart';

import '../domain/model/app_user.dart';
import '../util/constants.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  @override
  Future<List<AppUser>> fetch() async {
    final friends = await supabase.rpc('fetch_friends');

    print('friends: $friends');
    if (friends == null) {
      return [];
    }

    return friends.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }

  @override
  Future<void> sendFriendRequestsFromFriendId(String friendId) async {
    // TODO: rpcでリクエスト送信
  }

  @override
  Future<void> makeFriends(AppUser requestedUser, AppUser targetUser) async {
    // TODO: rpcでフレンド関係構築する
    await supabase.from('user_friend_requests').upsert({
      'user_id': requestedUser.id,
      'target_user_id': targetUser.id,
      'status': 'pending',
    });
  }
}
