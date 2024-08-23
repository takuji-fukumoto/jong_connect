import 'package:jong_connect/data/friends_repository.dart';

import '../domain/model/app_user.dart';
import '../util/constants.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  @override
  Future<void> sendFriendRequests(
      AppUser requestedUser, AppUser targetUser) async {
    await supabase.from('user_friend_requests').upsert({
      'user_id': requestedUser.id,
      'target_user_id': targetUser.id,
      'status': 'pending',
    });
  }

  @override
  Future<void> makeFriends(AppUser requestedUser, AppUser targetUser) async {
    // TODO: rgcでフレンド関係構築する
    await supabase.from('user_friend_requests').upsert({
      'user_id': requestedUser.id,
      'target_user_id': targetUser.id,
      'status': 'pending',
    });
  }
}
