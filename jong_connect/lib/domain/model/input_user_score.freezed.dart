// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_user_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InputUserScore _$InputUserScoreFromJson(Map<String, dynamic> json) {
  return _InputUserScore.fromJson(json);
}

/// @nodoc
mixin _$InputUserScore {
// FIXME: 過去の対局結果も編集できるようにしたい場合は退会済みユーザーを考慮する必要があるため、ここはnullableにす
  AppUser get user => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get seatingOrder => throw _privateConstructorUsedError;

  /// Serializes this InputUserScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputUserScoreCopyWith<InputUserScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputUserScoreCopyWith<$Res> {
  factory $InputUserScoreCopyWith(
          InputUserScore value, $Res Function(InputUserScore) then) =
      _$InputUserScoreCopyWithImpl<$Res, InputUserScore>;
  @useResult
  $Res call({AppUser user, int score, int seatingOrder});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class _$InputUserScoreCopyWithImpl<$Res, $Val extends InputUserScore>
    implements $InputUserScoreCopyWith<$Res> {
  _$InputUserScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? score = null,
    Object? seatingOrder = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      seatingOrder: null == seatingOrder
          ? _value.seatingOrder
          : seatingOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InputUserScoreImplCopyWith<$Res>
    implements $InputUserScoreCopyWith<$Res> {
  factory _$$InputUserScoreImplCopyWith(_$InputUserScoreImpl value,
          $Res Function(_$InputUserScoreImpl) then) =
      __$$InputUserScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppUser user, int score, int seatingOrder});

  @override
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InputUserScoreImplCopyWithImpl<$Res>
    extends _$InputUserScoreCopyWithImpl<$Res, _$InputUserScoreImpl>
    implements _$$InputUserScoreImplCopyWith<$Res> {
  __$$InputUserScoreImplCopyWithImpl(
      _$InputUserScoreImpl _value, $Res Function(_$InputUserScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? score = null,
    Object? seatingOrder = null,
  }) {
    return _then(_$InputUserScoreImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      seatingOrder: null == seatingOrder
          ? _value.seatingOrder
          : seatingOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InputUserScoreImpl implements _InputUserScore {
  const _$InputUserScoreImpl(
      {required this.user, required this.score, this.seatingOrder = 0});

  factory _$InputUserScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputUserScoreImplFromJson(json);

// FIXME: 過去の対局結果も編集できるようにしたい場合は退会済みユーザーを考慮する必要があるため、ここはnullableにす
  @override
  final AppUser user;
  @override
  final int score;
  @override
  @JsonKey()
  final int seatingOrder;

  @override
  String toString() {
    return 'InputUserScore(user: $user, score: $score, seatingOrder: $seatingOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputUserScoreImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.seatingOrder, seatingOrder) ||
                other.seatingOrder == seatingOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, score, seatingOrder);

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputUserScoreImplCopyWith<_$InputUserScoreImpl> get copyWith =>
      __$$InputUserScoreImplCopyWithImpl<_$InputUserScoreImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputUserScoreImplToJson(
      this,
    );
  }
}

abstract class _InputUserScore implements InputUserScore {
  const factory _InputUserScore(
      {required final AppUser user,
      required final int score,
      final int seatingOrder}) = _$InputUserScoreImpl;

  factory _InputUserScore.fromJson(Map<String, dynamic> json) =
      _$InputUserScoreImpl.fromJson;

// FIXME: 過去の対局結果も編集できるようにしたい場合は退会済みユーザーを考慮する必要があるため、ここはnullableにす
  @override
  AppUser get user;
  @override
  int get score;
  @override
  int get seatingOrder;

  /// Create a copy of InputUserScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputUserScoreImplCopyWith<_$InputUserScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
