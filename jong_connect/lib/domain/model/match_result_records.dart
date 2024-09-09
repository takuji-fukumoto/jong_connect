import 'package:freezed_annotation/freezed_annotation.dart';

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

  MatchResultRecords addResults(List<GroupMatchResult> newResults) {
    results.addAll(newResults);
    return copyWith(results: results);
  }

  /// 全て同じmatch_order前提
  MatchResultRecords editResults(List<GroupMatchResult> editedResults) {
    var targetOrder = editedResults.first.matchOrder;
    results.removeWhere((result) => result.matchOrder == targetOrder);
    results.addAll(editedResults);
    return copyWith(results: results);
  }

  MatchResultRecords deleteResults(int targetOrder) {
    results.removeWhere((result) => result.matchOrder == targetOrder);
    return copyWith(results: results);
  }
}
