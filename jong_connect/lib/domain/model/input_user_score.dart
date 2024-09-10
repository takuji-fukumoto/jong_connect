import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_user_score.freezed.dart';

part 'input_user_score.g.dart';

@freezed
class InputUserScore with _$InputUserScore {
  const factory InputUserScore({
    required String userId,
    required String userName,
    required int score,
    @Default(0) int seatingOrder,
  }) = _InputUserScore;

  factory InputUserScore.fromJson(Map<String, dynamic> json) =>
      _$InputUserScoreFromJson(json);
}
