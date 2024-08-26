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
  Future<void> makeFriend(AppUser targetUser) async {
    await supabase.rpc('make_friend', params: {
      'requested_user_id': targetUser.id,
      'requested_user_friend_id': targetUser.friendId,
    });
  }

  @override
  Future<void> sendFriendRequestsFromFriendId(int friendId) async {
    final response = await supabase.rpc('send_friend_request', params: {
      'target_friend_id': friendId,
    });

    print('send friend request response: $response');
  }

  @override
  Future<void> acceptFriendRequest(AppUser requestedUser) async {
    final response = await supabase.rpc('accept_friend_request', params: {
      'requested_user_id': requestedUser.id,
      'requested_user_friend_id': requestedUser.friendId,
    });

    print('accept friend request response: $response');
  }
}
