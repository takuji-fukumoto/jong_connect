import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group.dart';
import 'groups_repository_impl.dart';

part 'groups_repository.g.dart';

@riverpod
GroupsRepository groupsRepository(GroupsRepositoryRef ref) =>
    GroupsRepositoryImpl();

class GroupsRepository {
  Future<List<Group>> index() async {
    throw UnimplementedError();
  }

  Future<Group?> findById(int groupId) async {
    throw UnimplementedError();
  }

  Future<int> create(String name, String description) async {
    throw UnimplementedError();
  }

  Future<void> update(Group group) async {
    throw UnimplementedError();
  }
}
