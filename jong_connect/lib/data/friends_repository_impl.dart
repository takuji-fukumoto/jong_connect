import 'package:jong_connect/data/friends_repository.dart';
import 'package:jong_connect/domain/provider/current_user.dart';

import '../domain/model/app_user.dart';
import '../domain/model/user_friend_request.dart';
import '../util/constants.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  final FriendsRepositoryRef _ref;

  const FriendsRepositoryImpl(this._ref);

  @override
  Future<List<AppUser>> fetch() async {
    final friends = await supabase.rpc('fetch_friends');

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
  Future<List<UserFriendRequest>> fetchFriendRequests(
      FriendRequestStatus status) async {
    final user = await _ref.read(currentUserProvider.future);

    final response = await supabase.from('user_friend_requests').select('''
      id, 
      created_at, 
      user_id, 
      status,
      friends (
        id,
        name, 
        profile, 
        avatar_url,
        friend_id
      )
    ''').match({
      'friends.id': user!.id,
      'status': status,
    });

    return response
        .map<UserFriendRequest>((json) => UserFriendRequest.fromJson(json))
        .toList();
  }

  @override
  Stream<List<UserFriendRequest>> fetchPendingFriendRequestsStream() async* {
    throw UnimplementedError();
  }

  @override
  Future<void> sendFriendRequest(AppUser targetUser) async {
    final user = await _ref.read(currentUserProvider.future);
    await supabase.from('user_friend_requests').upsert({
      'user_id': user!.id,
      'status': FriendRequestStatus.pending,
      'friend_id': targetUser.friendId,
    });
  }

  @override
  Future<void> acceptFriendRequest(int friendRequestId) async {
    await supabase.rpc('accept_friend_request', params: {
      'friend_request_id': friendRequestId,
    });
  }

  @override
  Future<void> rejectFriendRequest(int friendRequestId) async {
    await supabase.from('user_friend_requests').update({
      'status': FriendRequestStatus.rejected,
    }).eq('id', friendRequestId);
  }

  @override
  Future<void> removeFriend(AppUser targetUser) async {
    await supabase.rpc('remove_friend', params: {
      'remove_friend_user_id': targetUser.id,
    });
  }
}
