import 'package:jong_connect/data/group_icons_repository.dart';

import '../domain/model/group_icon.dart';
import '../util/constants.dart';

class GroupIconsRepositoryImpl implements GroupIconsRepository {
  @override
  Future<List<GroupIcon>> get() async {
    final avatars = await supabase.from('group_icons').select('id,url');

    return avatars.map<GroupIcon>((json) => GroupIcon.fromJson(json)).toList();
  }
}
