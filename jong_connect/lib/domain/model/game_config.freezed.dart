// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
mixin _$GameConfig {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_starting_point')
  int get initialStartingPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'settlement_score')
  int get settlementScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_points')
  List<int> get positionPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_starting_point_for_three')
  int get initialStartingPointForThree => throw _privateConstructorUsedError;
  @JsonKey(name: 'settlement_score_for_three')
  int get settlementScoreForThree => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_points_for_three')
  List<int> get positionPointsForThree => throw _privateConstructorUsedError;

  /// Serializes this GameConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res, GameConfig>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'initial_starting_point') int initialStartingPoint,
      @JsonKey(name: 'settlement_score') int settlementScore,
      @JsonKey(name: 'position_points') List<int> positionPoints,
      @JsonKey(name: 'initial_starting_point_for_three')
      int initialStartingPointForThree,
      @JsonKey(name: 'settlement_score_for_three') int settlementScoreForThree,
      @JsonKey(name: 'position_points_for_three')
      List<int> positionPointsForThree});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res, $Val extends GameConfig>
    implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? initialStartingPoint = null,
    Object? settlementScore = null,
    Object? positionPoints = null,
    Object? initialStartingPointForThree = null,
    Object? settlementScoreForThree = null,
    Object? positionPointsForThree = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initialStartingPoint: null == initialStartingPoint
          ? _value.initialStartingPoint
          : initialStartingPoint // ignore: cast_nullable_to_non_nullable
              as int,
      settlementScore: null == settlementScore
          ? _value.settlementScore
          : settlementScore // ignore: cast_nullable_to_non_nullable
              as int,
      positionPoints: null == positionPoints
          ? _value.positionPoints
          : positionPoints // ignore: cast_nullable_to_non_nullable
              as List<int>,
      initialStartingPointForThree: null == initialStartingPointForThree
          ? _value.initialStartingPointForThree
          : initialStartingPointForThree // ignore: cast_nullable_to_non_nullable
              as int,
      settlementScoreForThree: null == settlementScoreForThree
          ? _value.settlementScoreForThree
          : settlementScoreForThree // ignore: cast_nullable_to_non_nullable
              as int,
      positionPointsForThree: null == positionPointsForThree
          ? _value.positionPointsForThree
          : positionPointsForThree // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameConfigImplCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$GameConfigImplCopyWith(
          _$GameConfigImpl value, $Res Function(_$GameConfigImpl) then) =
      __$$GameConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'initial_starting_point') int initialStartingPoint,
      @JsonKey(name: 'settlement_score') int settlementScore,
      @JsonKey(name: 'position_points') List<int> positionPoints,
      @JsonKey(name: 'initial_starting_point_for_three')
      int initialStartingPointForThree,
      @JsonKey(name: 'settlement_score_for_three') int settlementScoreForThree,
      @JsonKey(name: 'position_points_for_three')
      List<int> positionPointsForThree});
}

/// @nodoc
class __$$GameConfigImplCopyWithImpl<$Res>
    extends _$GameConfigCopyWithImpl<$Res, _$GameConfigImpl>
    implements _$$GameConfigImplCopyWith<$Res> {
  __$$GameConfigImplCopyWithImpl(
      _$GameConfigImpl _value, $Res Function(_$GameConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? initialStartingPoint = null,
    Object? settlementScore = null,
    Object? positionPoints = null,
    Object? initialStartingPointForThree = null,
    Object? settlementScoreForThree = null,
    Object? positionPointsForThree = null,
  }) {
    return _then(_$GameConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initialStartingPoint: null == initialStartingPoint
          ? _value.initialStartingPoint
          : initialStartingPoint // ignore: cast_nullable_to_non_nullable
              as int,
      settlementScore: null == settlementScore
          ? _value.settlementScore
          : settlementScore // ignore: cast_nullable_to_non_nullable
              as int,
      positionPoints: null == positionPoints
          ? _value._positionPoints
          : positionPoints // ignore: cast_nullable_to_non_nullable
              as List<int>,
      initialStartingPointForThree: null == initialStartingPointForThree
          ? _value.initialStartingPointForThree
          : initialStartingPointForThree // ignore: cast_nullable_to_non_nullable
              as int,
      settlementScoreForThree: null == settlementScoreForThree
          ? _value.settlementScoreForThree
          : settlementScoreForThree // ignore: cast_nullable_to_non_nullable
              as int,
      positionPointsForThree: null == positionPointsForThree
          ? _value._positionPointsForThree
          : positionPointsForThree // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameConfigImpl extends _GameConfig {
  const _$GameConfigImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'initial_starting_point')
      required this.initialStartingPoint,
      @JsonKey(name: 'settlement_score') required this.settlementScore,
      @JsonKey(name: 'position_points') required final List<int> positionPoints,
      @JsonKey(name: 'initial_starting_point_for_three')
      required this.initialStartingPointForThree,
      @JsonKey(name: 'settlement_score_for_three')
      required this.settlementScoreForThree,
      @JsonKey(name: 'position_points_for_three')
      required final List<int> positionPointsForThree})
      : _positionPoints = positionPoints,
        _positionPointsForThree = positionPointsForThree,
        super._();

  factory _$GameConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameConfigImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'initial_starting_point')
  final int initialStartingPoint;
  @override
  @JsonKey(name: 'settlement_score')
  final int settlementScore;
  final List<int> _positionPoints;
  @override
  @JsonKey(name: 'position_points')
  List<int> get positionPoints {
    if (_positionPoints is EqualUnmodifiableListView) return _positionPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positionPoints);
  }

  @override
  @JsonKey(name: 'initial_starting_point_for_three')
  final int initialStartingPointForThree;
  @override
  @JsonKey(name: 'settlement_score_for_three')
  final int settlementScoreForThree;
  final List<int> _positionPointsForThree;
  @override
  @JsonKey(name: 'position_points_for_three')
  List<int> get positionPointsForThree {
    if (_positionPointsForThree is EqualUnmodifiableListView)
      return _positionPointsForThree;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positionPointsForThree);
  }

  @override
  String toString() {
    return 'GameConfig(id: $id, userId: $userId, createdAt: $createdAt, initialStartingPoint: $initialStartingPoint, settlementScore: $settlementScore, positionPoints: $positionPoints, initialStartingPointForThree: $initialStartingPointForThree, settlementScoreForThree: $settlementScoreForThree, positionPointsForThree: $positionPointsForThree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.initialStartingPoint, initialStartingPoint) ||
                other.initialStartingPoint == initialStartingPoint) &&
            (identical(other.settlementScore, settlementScore) ||
                other.settlementScore == settlementScore) &&
            const DeepCollectionEquality()
                .equals(other._positionPoints, _positionPoints) &&
            (identical(other.initialStartingPointForThree,
                    initialStartingPointForThree) ||
                other.initialStartingPointForThree ==
                    initialStartingPointForThree) &&
            (identical(
                    other.settlementScoreForThree, settlementScoreForThree) ||
                other.settlementScoreForThree == settlementScoreForThree) &&
            const DeepCollectionEquality().equals(
                other._positionPointsForThree, _positionPointsForThree));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      createdAt,
      initialStartingPoint,
      settlementScore,
      const DeepCollectionEquality().hash(_positionPoints),
      initialStartingPointForThree,
      settlementScoreForThree,
      const DeepCollectionEquality().hash(_positionPointsForThree));

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
      __$$GameConfigImplCopyWithImpl<_$GameConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameConfigImplToJson(
      this,
    );
  }
}

abstract class _GameConfig extends GameConfig {
  const factory _GameConfig(
      {required final int id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'initial_starting_point')
      required final int initialStartingPoint,
      @JsonKey(name: 'settlement_score') required final int settlementScore,
      @JsonKey(name: 'position_points') required final List<int> positionPoints,
      @JsonKey(name: 'initial_starting_point_for_three')
      required final int initialStartingPointForThree,
      @JsonKey(name: 'settlement_score_for_three')
      required final int settlementScoreForThree,
      @JsonKey(name: 'position_points_for_three')
      required final List<int> positionPointsForThree}) = _$GameConfigImpl;
  const _GameConfig._() : super._();

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$GameConfigImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'initial_starting_point')
  int get initialStartingPoint;
  @override
  @JsonKey(name: 'settlement_score')
  int get settlementScore;
  @override
  @JsonKey(name: 'position_points')
  List<int> get positionPoints;
  @override
  @JsonKey(name: 'initial_starting_point_for_three')
  int get initialStartingPointForThree;
  @override
  @JsonKey(name: 'settlement_score_for_three')
  int get settlementScoreForThree;
  @override
  @JsonKey(name: 'position_points_for_three')
  List<int> get positionPointsForThree;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
