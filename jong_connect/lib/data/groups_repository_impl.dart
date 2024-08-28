import '../domain/model/app_user.dart';
import '../domain/model/group.dart';
import '../util/constants.dart';
import 'groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  @override
  Future<List<Group>> getGroups() async {
    final json = await supabase.from('groups').select('''
      id, 
      name, 
      description, 
      user_joinned_groups (
        users (
          id,
          name, 
          profile, 
          avatar_url,
          friend_id
        )
      )
    ''');

    print('group: $json');
    if (json.isEmpty) {
      return [];
    }

    return json.map<Group>((json) => Group.fromJson(json)).toList();
  }

  @override
  Stream<List<Group>> getGroupsStream() {
    // TODO: グループの更新が新しい順に並べる
    return supabase
        .from('chat_messages')
        // .select('''
        //   id,
        //   name,
        //   description,
        //   user_joinned_groups (
        //     users (
        //       id,
        //       name,
        //       profile,
        //       avatar_url,
        //       friend_id
        //     )
        //   )
        // ''')
        .stream(primaryKey: ['id'])
        // .order('updated_at', ascending: true)
        .map((events) {
      for (var i = 0; i < events.length; i++) {
        print(events[i]);
      }
      return events.map<Group>((json) => Group.fromJson(json)).toList();
    });
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
  Future<int> create(
      String name, String description, List<AppUser> joinUsers) async {
    final joinUserIds = joinUsers.map<String>((user) => user.id).toList();

    return await supabase.rpc('create_group', params: {
      'join_user_ids': joinUserIds,
      'group_name': name,
      'group_description': description,
    });
  }

  @override
  Future<void> update(Group group) async {
    throw UnimplementedError();
  }
}
