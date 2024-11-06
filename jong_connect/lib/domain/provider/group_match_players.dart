import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_user.dart';

part 'group_match_players.g.dart';

/// グループマッチに参加しているユーザー
/// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
@riverpod
Future<List<AppUser>> groupMatchPlayers(
    GroupMatchPlayersRef ref, int groupMatchId) async {
  // TODO: 参加者を取得、返却する
  // TODO: 参加者がいない場合、グループ内のユーザー全てを返す
  var group =
      await ref.read(groupDetailsProvider(groupId: groupMatchId).future);
  var members =
      group.joinedUsers?.map<AppUser>((joinUser) => joinUser.user!).toList() ??
          [];
  return members;
}
