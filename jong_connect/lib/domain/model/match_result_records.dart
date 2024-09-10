import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/util/exceptions/calc_match_results_exception.dart';

import '../../util/constants.dart';
import 'group_match_result.dart';

part 'match_result_records.freezed.dart';

part 'match_result_records.g.dart';

@freezed
class MatchResultRecords with _$MatchResultRecords {
  const MatchResultRecords._();

  @JsonSerializable(explicitToJson: true)
  const factory MatchResultRecords({
    required int groupId,
    required MatchType matchType,
    @Default([]) List<GroupMatchResult> results,
  }) = _MatchResultRecords;

  factory MatchResultRecords.fromJson(Map<String, dynamic> json) =>
      _$MatchResultRecordsFromJson(json);

  // UserID -> ラウンド順のトータルポイント
  Map<String, List<int?>> get totalPointsPerUser {
    if (results.isEmpty) {
      return {};
    }
    var matchPlayerIds =
        results.map<String>((result) => result.userId!).toSet();
    var totalPoints = <String, List<int?>>{};
    // 初期化
    for (var id in matchPlayerIds) {
      totalPoints[id] = List.generate(maxRounds, (i) => null);
    }

    // 順にtotal_pointをセット
    for (var result in results) {
      totalPoints[result.userId!]?[result.matchOrder - 1] ??=
          result.totalPoints;
    }

    return totalPoints;
  }

  int get maxRounds {
    if (results.isEmpty) {
      return 0;
    }
    var matchOrders = results.map<int>((result) => result.matchOrder).toSet();
    return matchOrders.reduce(max);
  }

  MatchResultRecords addResults(List<InputUserScore> inputScores) {
    if (inputScores.length < matchType.playableNumber) {
      throw CalcMatchResultsException(
          '集計に必要な対局者数に達していません: ${inputScores.length} / ${matchType.playableNumber}人');
    }

    var convertedInputScores = _convertFromInputUserScore(inputScores);

    return copyWith(results: [
      for (var result in results) ...[
        result,
      ],
      for (var newResult in convertedInputScores) ...[
        newResult,
      ],
    ]);
  }

  /// 全て同じmatch_order前提
  MatchResultRecords editResults(
      int targetOrder, List<InputUserScore> editedScores) {
    if (editedScores.length < matchType.playableNumber) {
      throw CalcMatchResultsException(
          '集計に必要な対局者数に達していません: ${editedScores.length} / ${matchType.playableNumber}人');
    }

    results.removeWhere((result) => result.matchOrder == targetOrder);
    var convertedInputScores =
        _convertFromInputUserScore(editedScores, targetOrder: targetOrder);
    return copyWith(results: [
      for (var result in results) ...[
        result,
      ],
      for (var newResult in convertedInputScores) ...[
        newResult,
      ],
    ]);
  }

  MatchResultRecords deleteResults(int targetOrder) {
    results.removeWhere((result) => result.matchOrder == targetOrder);
    return copyWith(results: results);
  }

  List<GroupMatchResult> _convertFromInputUserScore(
      List<InputUserScore> inputScores,
      {int? targetOrder}) {
    var createdAt = DateTime.now();
    var matchOrder = targetOrder ?? (maxRounds + 1);

    // 重複チェック
    // TODO: スコアが重複している場合座順もチェックする
    var scores = inputScores.map<int>((value) => value.score).toSet().toList();
    if (scores.length < matchType.playableNumber) {
      throw const CalcMatchResultsException('スコアが重複しています');
    }

    // スコアが高い順にトータルスコア算出
    inputScores.sort((a, b) => b.score.compareTo(a.score));
    var outputResults = <GroupMatchResult>[];
    for (var i = 0; i < inputScores.length; i++) {
      var rank = i + 1;
      var scoreString = inputScores[i].score.toString();
      if (scoreString.length >= 3) {
        // 5捨6入
        if (int.parse(scoreString[scoreString.length - 3]) > 5) {
          scoreString = scoreString.replaceRange(
              scoreString.length - 4,
              scoreString.length - 3,
              (int.parse(scoreString[scoreString.length - 4]) + 1).toString());
        }
      }
      // TODO: ウマオカ入れてトータル算出する
      var totalPoints = (int.parse(scoreString) / 1000).floor() - 25;
      outputResults.add(GroupMatchResult(
          id: 0,
          score: inputScores[i].score,
          rank: rank,
          totalPoints: totalPoints,
          matchOrder: matchOrder,
          createdAt: createdAt,
          userId: inputScores[i].userId,
          userName: inputScores[i].userName));
    }

    return outputResults;
  }
}
