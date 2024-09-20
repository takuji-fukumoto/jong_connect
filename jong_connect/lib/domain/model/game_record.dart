import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:jong_connect/util/constants.dart';

part 'game_record.freezed.dart';

part 'game_record.g.dart';

@freezed
class GameRecord with _$GameRecord {
  static const maxGameCount = 500;

  const GameRecord._();

  const factory GameRecord({
    required MatchType type,
    required int totalGames,
    required double? averageRank,
    required double? topTwoRate,
    required double? bustingRate,
    required int totalPoints,
    required double? averagePoints,
    required List<int> rankCounts,
    required List<int> recent20Ranks,
  }) = _GameRecord;

  String get totalGamesString {
    return totalGames >= maxGameCount
        ? '$maxGameCount+'
        : totalGames.toString();
  }

  String get averageRankString {
    return averageRank != null ? averageRank!.toStringAsFixed(2) : '-';
  }

  String get topTwoRateString {
    if (topTwoRate == null) {
      return '-';
    }

    return '${(topTwoRate! * 100).toStringAsFixed(2)} %';
  }

  String get bustingRateString {
    if (bustingRate == null) {
      return '-';
    }

    return '${(bustingRate! * 100).toStringAsFixed(2)} %';
  }

  String get averagePointsString {
    return averagePoints != null ? averagePoints!.toStringAsFixed(2) : '-';
  }

  factory GameRecord.fromJson(Map<String, dynamic> json) =>
      _$GameRecordFromJson(json);

  factory GameRecord.fromResults(
      MatchType type, List<GroupMatchResult> results) {
    final totalGames = results.length;

    // 1度も対局していない場合0除算しないように早期リターン
    if (totalGames <= 0) {
      return GameRecord(
        type: type,
        totalGames: 0,
        averageRank: null,
        topTwoRate: null,
        bustingRate: null,
        totalPoints: 0,
        averagePoints: null,
        rankCounts: List.generate(type.playableNumber, (_) => 0),
        recent20Ranks: [],
      );
    }

    final averageRank =
        results.map<int>((result) => result.rank).reduce((a, b) => a + b) /
            totalGames;
    final topTwoRate =
        results.where((result) => result.rank <= 2).length / totalGames;
    final bustingRate =
        results.where((result) => result.score < 0).length / totalGames;

    final totalPoints = results
        .map<int>((result) => result.totalPoints)
        .reduce((a, b) => a + b);
    final averagePoints = totalPoints / totalGames;
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
      bustingRate: bustingRate,
      totalPoints: totalPoints,
      averagePoints: averagePoints,
      rankCounts: rankCounts,
      recent20Ranks: recent20Ranks,
    );
  }
}
