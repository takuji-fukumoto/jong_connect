import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_ranking_item.dart';

part 'group_ranking.freezed.dart';

part 'group_ranking.g.dart';

@freezed
class GroupRanking with _$GroupRanking {
  const GroupRanking._();

  @JsonSerializable(explicitToJson: true)
  const factory GroupRanking({
    @JsonKey(name: 'ranking_items')
    required List<GroupRankingItem> rankingItems,
  }) = _GroupRanking;

  factory GroupRanking.fromJson(Map<String, dynamic> json) =>
      _$GroupRankingFromJson(json);

  factory GroupRanking.fromRankingItems(List<GroupRankingItem> items) =>
      GroupRanking(rankingItems: items);
}
