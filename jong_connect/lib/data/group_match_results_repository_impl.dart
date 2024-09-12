import '../domain/model/group_match_result.dart';
import '../domain/model/group_match_result_raw.dart';
import '../util/constants.dart';
import 'group_match_results_repository.dart';

class GroupMatchResultsRepositoryImpl implements GroupMatchResultsRepository {
  final _columns = '''
        id,
        created_at,
        user_id,
        user_name,
        score,
        rank,
        total_points,
        match_order,
        group_match_id,
        users (
          id,
          name, 
          profile, 
          avatar_url,
          friend_id
        )
    ''';

  @override
  Future<GroupMatchResult> get(int id) async {
    final json = await supabase
        .from('group_match_results')
        .select(_columns)
        .eq('id', id)
        .limit(1);

    return json
        .map<GroupMatchResult>((result) => GroupMatchResult.fromJson(result))
        .toList()
        .first;
  }

  @override
  Future<List<GroupMatchResult>> getGroupMatchResults(int groupMatchId) async {
    final json = await supabase
        .from('group_match_results')
        .select(_columns)
        .eq('group_match_id', groupMatchId);

    return json
        .map<GroupMatchResult>((result) => GroupMatchResult.fromJson(result))
        .toList();
  }

  @override
  Future<List<GroupMatchResult>> getByMatchOrder(
      int groupMatchId, int matchOrder) async {
    final json = await supabase
        .from('group_match_results')
        .select(_columns)
        .match({'group_match_id': groupMatchId, 'match_order': matchOrder});

    return json
        .map<GroupMatchResult>((result) => GroupMatchResult.fromJson(result))
        .toList();
  }

  @override
  Future<void> createRoundResults({
    required int groupMatchId,
    required int matchOrder,
    required List<GroupMatchResultRaw> results,
  }) async {
    List<Map<String, dynamic>> insertData = [];
    for (var result in results) {
      insertData.add({
        'user_id': result.user.id,
        'user_name': result.user.name,
        'group_match_id': groupMatchId,
        'score': result.score,
        'rank': result.rank,
        'total_points': result.totalPoints,
        'match_order': matchOrder,
      });
    }

    await supabase.from('group_match_results').insert(insertData);
  }

  @override
  Future<void> upsert(List<GroupMatchResult> results) async {
    var outputData = <Map<String, dynamic>>[];
    for (var result in results) {
      outputData.add({
        'id': result.id,
        'group_match_id': result.groupMatchId,
        'score': result.score,
        'rank': result.rank,
        'total_points': result.totalPoints,
        'match_order': result.matchOrder,
        'user_id': result.userId,
        'user_name': result.userName,
      });
    }
    await supabase.from('group_match_results').upsert(outputData);
  }

  @override
  Future<void> delete(int groupMatchId) async {
    throw UnimplementedError();
  }
}
