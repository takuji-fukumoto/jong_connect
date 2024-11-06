import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/app_user.dart';
import 'package:jong_connect/domain/model/group_match.dart';

import 'group.dart';

part 'joined_group_match_players.freezed.dart';

part 'joined_group_match_players.g.dart';

// TODO: 不要そうであればファイルごと削除する
@freezed
class JoinedGroupMatchPlayers with _$JoinedGroupMatchPlayers {
  const factory JoinedGroupMatchPlayers({
    required int id,
    @JsonKey(name: 'user') AppUser? user,
    @JsonKey(name: 'group_match') GroupMatch? groupMatch,
  }) = _JoinedGroupMatchPlayers;

  factory JoinedGroupMatchPlayers.fromJson(Map<String, dynamic> json) =>
      _$JoinedGroupMatchPlayersFromJson(json);
}
