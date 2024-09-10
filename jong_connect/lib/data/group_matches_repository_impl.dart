import 'package:jong_connect/domain/model/group_match.dart';

import '../domain/model/app_user.dart';
import '../domain/model/group_match_result.dart';
import '../util/constants.dart';
import 'group_matches_repository.dart';

class GroupMatchesRepositoryImpl implements GroupMatchesRepository {
  @override
  Future<List<GroupMatch>> getWithResults(int groupId, {int limit = 50}) async {
    print('get results');
    final json = await supabase
        .from('group_matches')
        .select('''
      id, 
      group_id,
      created_at, 
      users (
          id,
          name, 
          profile, 
          avatar_url,
          friend_id
      ),
      match_type, 
      group_match_results (
        id,
        created_at,
        user_id,
        user_name,
        score,
        rank,
        total_points,
        match_order,
        users (
          id,
          name, 
          profile, 
          avatar_url,
          friend_id
        )
      )
    ''')
        .eq('group_id', groupId)
        .order('created_at', ascending: true)
        .limit(limit);

    return json.map<GroupMatch>((match) => GroupMatch.fromJson(match)).toList();
  }

  @override
  Future<void> createWithResults(int groupId, AppUser createdUser,
      MatchType type, List<GroupMatchResult> results) async {
    var resultsJson =
    results.map<Map<String, dynamic>>((result) => result.toJson()).toList();

    return await supabase.rpc('create_group_match_with_results', params: {
      'group_id': groupId,
      'created_user_id': createdUser.id,
      'match_type': type.name,
      'results': resultsJson,
    });
  }

  @override
  Future<void> updateResults(int groupMatchId,
      List<GroupMatchResult> results) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int groupMatchId) async {
    throw UnimplementedError();
  }
}
