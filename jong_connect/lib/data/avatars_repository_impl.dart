import 'package:jong_connect/data/avatars_repository.dart';

import '../domain/model/avatar.dart';
import '../util/constants.dart';

class AvatarsRepositoryImpl implements AvatarsRepository {
  @override
  Future<List<Avatar>> get() async {
    final avatars = await supabase.from('avatars').select('id,url');

    return avatars.map<Avatar>((json) => Avatar.fromJson(json)).toList();
  }
}
