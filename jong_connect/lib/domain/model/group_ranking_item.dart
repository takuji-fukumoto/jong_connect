import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_ranking_item.freezed.dart';

part 'group_ranking_item.g.dart';

@freezed
class GroupRankingItem with _$GroupRankingItem {
  const GroupRankingItem._();

  @JsonSerializable(explicitToJson: true)
  const factory GroupRankingItem({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'total_score') required int totalScore,
    @JsonKey(name: 'average_rank') required double averageRank,
    @JsonKey(name: 'total_games') required int totalGames,
  }) = _GroupRankingItem;

  factory GroupRankingItem.fromJson(Map<String, dynamic> json) =>
      _$GroupRankingItemFromJson(json);
}
