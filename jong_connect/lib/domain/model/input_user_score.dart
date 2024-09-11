import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_user.dart';

part 'input_user_score.freezed.dart';

part 'input_user_score.g.dart';

@freezed
class InputUserScore with _$InputUserScore {
  const factory InputUserScore({
    // FIXME: 過去の対局結果も編集できるようにしたい場合は退会済みユーザーを考慮する必要があるため、ここはnullableにす
    required AppUser user,
    required int score,
    @Default(0) int seatingOrder,
  }) = _InputUserScore;

  factory InputUserScore.fromJson(Map<String, dynamic> json) =>
      _$InputUserScoreFromJson(json);
}
