import '../domain/model/group.dart';
import '../util/constants.dart';
import 'groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  @override
  Future<List<Group>> index() async {
    final groups = await supabase.rpc('fetch_joined_groups');

    print('groups: $groups');
    if (groups == null) {
      return [];
    }

    return groups.map<Group>((json) => Group.fromJson(json)).toList();
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
  Future<int> create(String name, String description) async {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Group group) async {
    throw UnimplementedError();
  }
}
