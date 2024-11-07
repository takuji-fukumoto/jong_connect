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
  Future<List<UserFriendRequest>> fetchFriendRequestsInProgress() async {
    final user = await _ref.read(currentUserProvider.future);

    final response = await supabase.from('user_friend_requests').select('''
      id, 
      created_at, 
      user_id, 
      status,
      friend_id,
      user:friend_id (
        id,
        name, 
        profile, 
        avatar_url,
        friend_id
      )
    ''').match({
      'user_id': user!.id,
      'status': FriendRequestStatus.pending.name,
    });

    return response
        .map<UserFriendRequest>((json) => UserFriendRequest.fromJson(json))
        .toList();
  }

  @override
  Future<List<UserFriendRequest>>
      fetchFriendRequestsWaitingForApproval() async {
    final user = await _ref.read(currentUserProvider.future);

    final response = await supabase.from('user_friend_requests').select('''
      id, 
      created_at, 
      user_id,
      user:user_id (
        id,
        name, 
        profile, 
        avatar_url,
        friend_id
      ),
      status,
      friend_id
    ''').match({
      'friend_id': user!.friendId,
      'status': FriendRequestStatus.pending.name,
    });

    return response
        .map<UserFriendRequest>((json) => UserFriendRequest.fromJson(json))
        .toList();
  }

  @override
  Stream<List<UserFriendRequest>> fetchPendingFriendRequestsStream(
      int currentUserFriendId) {
    return supabase
        .from('user_friend_requests')
        .stream(primaryKey: ['id'])
        .eq('status', FriendRequestStatus.pending.name)
        .map((events) {
          /// 相手から申請がきたもののみフィルタして返却
          return events
              .map<UserFriendRequest>(
                  (json) => UserFriendRequest.fromJson(json))
              .where((request) => request.friendId == currentUserFriendId)
              .toList();
        });
  }

  @override
  Future<void> sendFriendRequest(AppUser targetUser) async {
    final user = await _ref.read(currentUserProvider.future);

    // MEMO: すでにリクエストがあればそこに上書きする
    final response = await supabase.from('user_friend_requests').select('''
      id
    ''').match({
      'user_id': user!.id,
      'friend_id': targetUser.friendId,
    }).limit(1);

    int? alreadyFriendRequestId =
        response.isNotEmpty ? response.first['id'] : null;

    if (alreadyFriendRequestId != null) {
      // FIXME: これだとあまりupsertの意味がないが、upsertのonConflictで複合キーの指定の仕方がわからないため一旦このまま
      await supabase.from('user_friend_requests').upsert(
        {
          'id': alreadyFriendRequestId,
          'user_id': user.id,
          'status': FriendRequestStatus.pending.name,
          'friend_id': targetUser.friendId,
        },
      );
    } else {
      await supabase.from('user_friend_requests').insert({
        'user_id': user.id,
        'status': FriendRequestStatus.pending.name,
        'friend_id': targetUser.friendId,
      });
    }
  }

  @override
  Future<bool> isRequestedFriendUser(int targetFriendId) async {
    final user = await _ref.read(currentUserProvider.future);
    var count = await supabase.from('user_friend_requests').count().match({
      'user_id': user!.id,
      'friend_id': targetFriendId,
      'status': FriendRequestStatus.pending.name,
    }).limit(1);

    return count >= 1;
  }

  @override
  Future<void> deleteFriendRequest(int friendRequestId) async {
    await supabase
        .from('user_friend_requests')
        .delete()
        .eq('id', friendRequestId);
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
      'status': FriendRequestStatus.rejected.name,
    }).eq('id', friendRequestId);
  }

  @override
  Future<void> removeFriend(AppUser targetUser) async {
    await supabase.rpc('remove_friend', params: {
      'remove_friend_user_id': targetUser.id,
    });
  }
}
