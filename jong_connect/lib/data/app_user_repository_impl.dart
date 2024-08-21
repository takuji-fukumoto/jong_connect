import 'package:jong_connect/data/app_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/app_user.dart';
import '../util/constants.dart';

part 'app_user_repository_impl.g.dart';

@riverpod
AppUserRepositoryImpl appUserRepositoryImpl(AppUserRepositoryImplRef ref) =>
    AppUserRepositoryImpl();

class AppUserRepositoryImpl implements AppUserRepository {
  @override
  Future<AppUser?> get(String uuid) async {
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
  Future<void> put(AppUser user) async {
    // TODO: toJsonしてそのまま入れたほうがいいかも
    await supabase.from('users').update({
      'name': user.name,
      'profile': user.profile,
      'avatar_url': user.avatarUrl,
      'friend_id': user.friendId,
    }).eq('id', user.id);
  }

  @override
  Future<bool> existsFriendId(String friendId) async {
    return await supabase
        .rpc('exists_friend_id', params: {'target_id': friendId});
  }
}
