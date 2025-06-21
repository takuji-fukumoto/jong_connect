import '../domain/model/season.dart';

import '../util/constants.dart';
import 'seasons_repository.dart';

class SeasonsRepositoryImpl implements SeasonsRepository {
  @override
  Future<List<Season>> getGroupSeasons(int groupId) async {
    final seasons = await supabase.from('seasons').select('''
      id, 
      name, 
      description,
      group_id,
      created_at
    ''').eq('group_id', groupId);

    return seasons.map<Season>((json) => Season.fromJson(json)).toList();
  }

  @override
  Future<Season?> findById(int seasonId) async {
    final json = await supabase.from('seasons').select('''
      id,
      name,
      description,
      group_id,
      created_at
    ''').eq('id', seasonId).limit(1);

    if (json.isEmpty) {
      return null;
    }

    return Season.fromJson(json.first);
  }

  @override
  Future<void> create(String name, String description, int groupId) async {
    Map<String, dynamic> insertData = {
      'name': name,
      'description': description,
      'group_id': groupId,
    };

    await supabase.from('seasons').insert(insertData);
  }

  @override
  Future<void> update(Season season) async {
    await supabase.from('seasons').update(season.toJson());
  }

  @override
  Future<void> delete(int seasonId) async {
    await supabase.from('seasons').delete().match({'id': seasonId});
  }
}
