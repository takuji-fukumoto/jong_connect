import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:jong_connect/util/constants.dart';

part 'game_record.freezed.dart';

part 'game_record.g.dart';

@freezed
class GameRecord with _$GameRecord {
  const GameRecord._();

  const factory GameRecord({
    required MatchType type,
    required int totalGames,
    required double averageRank,
    required double topTwoRate,
    required int totalPoints,
    required double averagePoints,
    required List<int> rankCounts,
    required List<int> recent20Ranks,
  }) = _GameRecord;

  factory GameRecord.fromJson(Map<String, dynamic> json) =>
      _$GameRecordFromJson(json);

  factory GameRecord.fromResults(
      MatchType type, List<GroupMatchResult> results) {
    final totalGames = results.length;
    final averageRank =
        results.map<int>((result) => result.rank).reduce((a, b) => a + b) /
            results.length;
    final topTwoRate =
        results.where((result) => result.rank <= 2).length / results.length;
    final totalPoints = results
        .map<int>((result) => result.totalPoints)
        .reduce((a, b) => a + b);
    final averagePoints = totalPoints / results.length;
    var rankCounts = List.generate(type.playableNumber, (index) => 0);
    for (var result in results) {
      rankCounts[result.rank - 1]++;
    }
    final recent20Ranks =
        results.take(20).map<int>((result) => result.rank).toList();

    return GameRecord(
        type: type,
        totalGames: totalGames,
        averageRank: averageRank,
        topTwoRate: topTwoRate,
        totalPoints: totalPoints,
        averagePoints: averagePoints,
        rankCounts: rankCounts,
        recent20Ranks: recent20Ranks);
  }
}
