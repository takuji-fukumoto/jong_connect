import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_user.dart';

part 'group_match_players.g.dart';

@riverpod
class GroupMatchPlayers extends _$GroupMatchPlayers {
  @override
  FutureOr<List<AppUser>> build(int groupId) async {
    var group = await ref.read(groupDetailsProvider(groupId: groupId).future);
    var players = group.joinedUsers
            ?.map<AppUser>((joinUser) => joinUser.user!)
            .toList() ??
        [];
    return players;
  }

  void updatePlayers(List<AppUser> players) {
    state = AsyncData(players);
  }
}
