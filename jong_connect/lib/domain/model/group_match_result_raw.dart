import '../../util/constants.dart';
import '../../util/exceptions/calc_match_results_exception.dart';
import 'app_user.dart';
import 'input_user_score.dart';

class GroupMatchResultRaw {
  const GroupMatchResultRaw({
    required this.user,
    required this.score,
    required this.rank,
    required this.totalPoints,
  });

  final AppUser user;
  final int score;
  final int rank;
  final int totalPoints;

  static List<GroupMatchResultRaw> convertFromRoundInputScores(
      List<InputUserScore> inputScores, MatchType type) {
    // 重複チェック
    // TODO: スコアが重複している場合座順もチェックする
    var scores = inputScores.map<int>((value) => value.score).toSet().toList();
    if (scores.length < type.playableNumber) {
      throw const CalcMatchResultsException('スコアが重複しています');
    }

    // スコアが高い順にトータルスコア算出
    inputScores.sort((a, b) => b.score.compareTo(a.score));
    var outputResults = <GroupMatchResultRaw>[];
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
      outputResults.add(GroupMatchResultRaw(
        user: inputScores[i].user,
        score: inputScores[i].score,
        rank: rank,
        totalPoints: totalPoints,
      ));
    }

    return outputResults;
  }
}
