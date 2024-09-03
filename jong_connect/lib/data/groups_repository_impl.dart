import '../domain/model/app_user.dart';
import '../domain/model/group.dart';
import '../util/constants.dart';
import 'groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  @override
  Future<Group> getGroupDetails(int groupId) async {
    final json = await supabase.from('groups').select('''
      id, 
      name, 
      description, 
      image_url,
      user_joinned_groups (
        users (
          id,
          name, 
          profile, 
          avatar_url,
          friend_id
        )
      )
    ''').eq('id', groupId).limit(1);

    if (json.isEmpty) {
      throw Exception('グループが見つかりません。');
    }

    return Group.fromJson(json.first);
  }

  @override
  Stream<List<Group>> getGroupsStream() {
    // TODO: グループの更新が新しい順に並べる
    return supabase.from('groups').stream(primaryKey: ['id'])
        // .order('updated_at', ascending: true)
        .map((events) {
      for (var i = 0; i < events.length; i++) {
        print('$i番目のevent');
        print(events[i]);
      }
      return events.map<Group>((json) => Group.fromJson(json)).toList();
    });

    //FIXME: 現状selectとstreamは組み合わせできず、streamの場合は単一テーブルしか取得できない。今後もしかしたら対応してくれるかも？
    // return supabase
    //     .from('groups')
    //     // .select('''
    //     //   id,
    //     //   name,
    //     //   description,
    //     //   user_joinned_groups (
    //     //     users (
    //     //       id,
    //     //       name,
    //     //       profile,
    //     //       avatar_url,
    //     //       friend_id
    //     //     )
    //     //   )
    //     // ''')
    //     .asStream()
    //     // .order('updated_at', ascending: true)
    //     .map((events) {
    //   for (var i = 0; i < events.length; i++) {
    //     print(events[i]);
    //   }
    //   return events.map<Group>((json) => Group.fromJson(json)).toList();
    // });
  }

  @override
  Future<Group?> findById(int groupId) async {
    final json = await supabase
        .from('groups')
        .select('id, name, description')
        .eq('id', groupId)
        .limit(1);

    print('group: $json');
    if (json.isEmpty) {
      return null;
    }

    return Group.fromJson(json.first);
  }

  @override
  Future<int> create(String name, String description, String imageUrl,
      List<AppUser> joinUsers) async {
    final joinUserIds = joinUsers.map<String>((user) => user.id).toList();

    return await supabase.rpc('create_group', params: {
      'join_user_ids': joinUserIds,
      'group_name': name,
      'group_description': description,
      'image_url': imageUrl,
    });
  }

  @override
  Future<void> update(Group group) async {
    final joinedUserIds =
        group.joinedUsers!.map<String>((joined) => joined.user!.id).toList();
    return await supabase.rpc('edit_group', params: {
      'id': group.id,
      'join_user_ids': joinedUserIds,
      'group_name': group.name,
      'group_description': group.description,
      'image_url': group.imageUrl,
    });
  }

  @override
  Future<void> exitFromGroup(int groupId) async {
    return await supabase.rpc('exit_from_group', params: {
      'group_id': groupId,
    });
  }
}
