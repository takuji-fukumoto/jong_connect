import 'package:jong_connect/data/avatars_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/avatar.dart';
import '../util/constants.dart';

part 'avatars_repository_impl.g.dart';

@riverpod
AvatarsRepositoryImpl avatarsRepositoryImpl(AvatarsRepositoryImplRef ref) =>
    AvatarsRepositoryImpl();

class AvatarsRepositoryImpl implements AvatarsRepository {
  @override
  Future<List<Avatar>> get() async {
    final avatars = await supabase.from('avatars').select('id,url');

    return avatars.map<Avatar>((json) => Avatar.fromJson(json)).toList();
  }
}
