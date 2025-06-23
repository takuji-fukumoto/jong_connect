import 'package:jong_connect/data/group_matches_repository.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/group_match.dart';
import '../domain/provider/group_matches.dart';

part 'group_match_use_case.g.dart';

@riverpod
GroupMatchUseCase groupMatchUseCase(GroupMatchUseCaseRef ref) =>
    GroupMatchUseCase(ref);

class GroupMatchUseCase {
  final GroupMatchUseCaseRef _ref;

  GroupMatchUseCase(this._ref);

  Future<GroupMatch> createGroupMatch(int groupId, MatchType type) async {
    var user = await _ref.read(currentUserProvider.future);
    if (user == null) {
      throw Exception('ログインしてください');
    }

    return await _ref
        .read(groupMatchesRepositoryProvider)
        .create(groupId, user, type);
  }

  Future<void> updateSeason(GroupMatch match, int? seasonId) async {
    await _ref
        .read(groupMatchesRepositoryProvider)
        .updateSeason(match.id, seasonId);
    _ref.invalidate(groupMatchesProvider(groupId: match.groupId));
  }

  Future<void> closeMatch(GroupMatch match) async {
    await _ref.read(groupMatchesRepositoryProvider).closeMatch(match.id);
    _ref.invalidate(groupMatchesProvider(groupId: match.groupId));
  }

  Future<void> deleteMatch(GroupMatch match) async {
    await _ref.read(groupMatchesRepositoryProvider).delete(match.id);
    _ref.invalidate(groupMatchesProvider(groupId: match.groupId));
  }
}
