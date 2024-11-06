import 'package:jong_connect/domain/model/group_match.dart';

import '../domain/model/app_user.dart';
import '../domain/model/group_match_result.dart';
import '../util/constants.dart';
import 'group_matches_repository.dart';

class GroupMatchesRepositoryImpl implements GroupMatchesRepository {
  final _columns = '''
      id, 
      group_id,
      created_at, 
      end_at,
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
    ''';

  @override
  Future<GroupMatch> get(int groupMatchId) async {
    final json = await supabase
        .from('group_matches')
        .select(_columns)
        .eq('id', groupMatchId)
        .limit(1);

    return json
        .map<GroupMatch>((match) => GroupMatch.fromJson(match))
        .toList()
        .first;
  }

  @override
  Future<List<GroupMatch>> getAll(int groupId, {int limit = 50}) async {
    final json = await supabase
        .from('group_matches')
        .select(_columns)
        .eq('group_id', groupId)
        .order('created_at', ascending: true)
        .limit(limit);

    return json.map<GroupMatch>((match) => GroupMatch.fromJson(match)).toList();
  }

  @override
  Future<GroupMatch> create(
      int groupId, AppUser createdUser, MatchType type) async {
    var data = await supabase.from('group_matches').insert([
      {'group_id': groupId, 'user_id': createdUser.id, 'match_type': type.name},
    ]).select();

    return data
        .map<GroupMatch>((match) => GroupMatch.fromJson(match))
        .toList()
        .first;
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
  Future<void> updateResults(
      int groupMatchId, List<GroupMatchResult> results) async {
    throw UnimplementedError();
  }

  @override
  Future<void> closeMatch(int groupMatchId) async {
    await supabase.from('group_matches').update(
        {'end_at': DateTime.now().toIso8601String()}).eq('id', groupMatchId);
  }

  @override
  Future<void> delete(int groupMatchId) async {
    await supabase.from('group_matches').delete().eq('id', groupMatchId);
  }

  @override
  Future<List<AppUser>> getGroupMatchPlayers(int groupMatchId) async {
    final json = await supabase.from('joined_group_match_players').select('''
      id, 
      user:user_id (
        id,
        name, 
        profile, 
        avatar_url,
        friend_id
      )
    ''').eq('id', groupMatchId);

    return json
        .map<AppUser>((record) => AppUser.fromJson(record['user']))
        .toList();
  }

  @override
  Future<void> updateGroupMatchPlayers(
      int groupMatchId, List<String> playerIds) async {
    return await supabase.rpc('edit_group_match_players', params: {
      'group_match_id': groupMatchId,
      'join_player_ids': playerIds,
    });
  }
}
