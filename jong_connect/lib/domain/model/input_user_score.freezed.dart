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
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
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
  $Res call({String userId, String userName, int score, int seatingOrder});
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
    Object? userId = null,
    Object? userName = null,
    Object? score = null,
    Object? seatingOrder = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$InputUserScoreImplCopyWith<$Res>
    implements $InputUserScoreCopyWith<$Res> {
  factory _$$InputUserScoreImplCopyWith(_$InputUserScoreImpl value,
          $Res Function(_$InputUserScoreImpl) then) =
      __$$InputUserScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, int score, int seatingOrder});
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
    Object? userId = null,
    Object? userName = null,
    Object? score = null,
    Object? seatingOrder = null,
  }) {
    return _then(_$InputUserScoreImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.userId,
      required this.userName,
      required this.score,
      this.seatingOrder = 0});

  factory _$InputUserScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputUserScoreImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final int score;
  @override
  @JsonKey()
  final int seatingOrder;

  @override
  String toString() {
    return 'InputUserScore(userId: $userId, userName: $userName, score: $score, seatingOrder: $seatingOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputUserScoreImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.seatingOrder, seatingOrder) ||
                other.seatingOrder == seatingOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, score, seatingOrder);

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
      {required final String userId,
      required final String userName,
      required final int score,
      final int seatingOrder}) = _$InputUserScoreImpl;

  factory _InputUserScore.fromJson(Map<String, dynamic> json) =
      _$InputUserScoreImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
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
