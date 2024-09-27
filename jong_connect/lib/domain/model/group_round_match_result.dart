import 'package:jong_connect/domain/model/group_match_result.dart';

/// 1ラウンドの各ユーザー成績
class GroupRoundMatchResult {
  const GroupRoundMatchResult({
    required this.groupMatchId,
    required this.matchOrder,
    required this.results,
  });

  final int groupMatchId;
  final int matchOrder;
  final List<GroupMatchResult> results;

  List<GroupMatchResult> get resultsOrderByRank {
    var copy = [...results];
    copy.sort((a, b) => a.rank.compareTo(b.rank));
    return copy.toList();
  }
}
