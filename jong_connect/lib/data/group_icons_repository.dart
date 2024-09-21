import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_icon.dart';
import 'group_icons_repository_impl.dart';

part 'group_icons_repository.g.dart';

@riverpod
GroupIconsRepository groupIconsRepository(GroupIconsRepositoryRef ref) =>
    GroupIconsRepositoryImpl();

class GroupIconsRepository {
  Future<List<GroupIcon>> get() async {
    throw UnimplementedError();
  }
}
