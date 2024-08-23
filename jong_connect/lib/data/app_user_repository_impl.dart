import 'package:jong_connect/data/app_user_repository.dart';

import '../domain/model/app_user.dart';
import '../util/constants.dart';

class AppUserRepositoryImpl implements AppUserRepository {
  @override
  Future<AppUser?> fetch(String uuid) async {
    final user = await supabase
        .from('users')
        .select('id,name,profile,avatar_url,friend_id')
        .eq('id', uuid)
        .limit(1);

    if (user.isEmpty) {
      return null;
    }

    return AppUser.fromJson(user.first);
  }

  @override
  Future<AppUser?> fetchFromFriendId(int friendId) async {
    final user = await supabase
        .from('users')
        .select('id,name,profile,avatar_url,friend_id')
        .eq('friend_id', friendId)
        .limit(1);

    if (user.isEmpty) {
      return null;
    }

    return AppUser.fromJson(user.first);
  }

  @override
  Future<void> update(AppUser user) async {
    await supabase.from('users').update({
      'name': user.name,
      'profile': user.profile,
      'avatar_url': user.avatarUrl,
    }).eq('id', user.id);
  }
}
