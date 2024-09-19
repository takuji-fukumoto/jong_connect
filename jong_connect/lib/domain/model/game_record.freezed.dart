// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameRecord _$GameRecordFromJson(Map<String, dynamic> json) {
  return _GameRecord.fromJson(json);
}

/// @nodoc
mixin _$GameRecord {
  MatchType get type => throw _privateConstructorUsedError;
  int get totalGames => throw _privateConstructorUsedError;
  double get averageRank => throw _privateConstructorUsedError;
  double get topTwoRate => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  double get averagePoints => throw _privateConstructorUsedError;
  List<int> get rankCounts => throw _privateConstructorUsedError;
  List<int> get recent20Ranks => throw _privateConstructorUsedError;

  /// Serializes this GameRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameRecordCopyWith<GameRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRecordCopyWith<$Res> {
  factory $GameRecordCopyWith(
          GameRecord value, $Res Function(GameRecord) then) =
      _$GameRecordCopyWithImpl<$Res, GameRecord>;
  @useResult
  $Res call(
      {MatchType type,
      int totalGames,
      double averageRank,
      double topTwoRate,
      int totalPoints,
      double averagePoints,
      List<int> rankCounts,
      List<int> recent20Ranks});
}

/// @nodoc
class _$GameRecordCopyWithImpl<$Res, $Val extends GameRecord>
    implements $GameRecordCopyWith<$Res> {
  _$GameRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? totalGames = null,
    Object? averageRank = null,
    Object? topTwoRate = null,
    Object? totalPoints = null,
    Object? averagePoints = null,
    Object? rankCounts = null,
    Object? recent20Ranks = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MatchType,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
      averageRank: null == averageRank
          ? _value.averageRank
          : averageRank // ignore: cast_nullable_to_non_nullable
              as double,
      topTwoRate: null == topTwoRate
          ? _value.topTwoRate
          : topTwoRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      averagePoints: null == averagePoints
          ? _value.averagePoints
          : averagePoints // ignore: cast_nullable_to_non_nullable
              as double,
      rankCounts: null == rankCounts
          ? _value.rankCounts
          : rankCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recent20Ranks: null == recent20Ranks
          ? _value.recent20Ranks
          : recent20Ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRecordImplCopyWith<$Res>
    implements $GameRecordCopyWith<$Res> {
  factory _$$GameRecordImplCopyWith(
          _$GameRecordImpl value, $Res Function(_$GameRecordImpl) then) =
      __$$GameRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MatchType type,
      int totalGames,
      double averageRank,
      double topTwoRate,
      int totalPoints,
      double averagePoints,
      List<int> rankCounts,
      List<int> recent20Ranks});
}

/// @nodoc
class __$$GameRecordImplCopyWithImpl<$Res>
    extends _$GameRecordCopyWithImpl<$Res, _$GameRecordImpl>
    implements _$$GameRecordImplCopyWith<$Res> {
  __$$GameRecordImplCopyWithImpl(
      _$GameRecordImpl _value, $Res Function(_$GameRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? totalGames = null,
    Object? averageRank = null,
    Object? topTwoRate = null,
    Object? totalPoints = null,
    Object? averagePoints = null,
    Object? rankCounts = null,
    Object? recent20Ranks = null,
  }) {
    return _then(_$GameRecordImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MatchType,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
      averageRank: null == averageRank
          ? _value.averageRank
          : averageRank // ignore: cast_nullable_to_non_nullable
              as double,
      topTwoRate: null == topTwoRate
          ? _value.topTwoRate
          : topTwoRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      averagePoints: null == averagePoints
          ? _value.averagePoints
          : averagePoints // ignore: cast_nullable_to_non_nullable
              as double,
      rankCounts: null == rankCounts
          ? _value._rankCounts
          : rankCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recent20Ranks: null == recent20Ranks
          ? _value._recent20Ranks
          : recent20Ranks // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRecordImpl extends _GameRecord {
  const _$GameRecordImpl(
      {required this.type,
      required this.totalGames,
      required this.averageRank,
      required this.topTwoRate,
      required this.totalPoints,
      required this.averagePoints,
      required final List<int> rankCounts,
      required final List<int> recent20Ranks})
      : _rankCounts = rankCounts,
        _recent20Ranks = recent20Ranks,
        super._();

  factory _$GameRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRecordImplFromJson(json);

  @override
  final MatchType type;
  @override
  final int totalGames;
  @override
  final double averageRank;
  @override
  final double topTwoRate;
  @override
  final int totalPoints;
  @override
  final double averagePoints;
  final List<int> _rankCounts;
  @override
  List<int> get rankCounts {
    if (_rankCounts is EqualUnmodifiableListView) return _rankCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankCounts);
  }

  final List<int> _recent20Ranks;
  @override
  List<int> get recent20Ranks {
    if (_recent20Ranks is EqualUnmodifiableListView) return _recent20Ranks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recent20Ranks);
  }

  @override
  String toString() {
    return 'GameRecord(type: $type, totalGames: $totalGames, averageRank: $averageRank, topTwoRate: $topTwoRate, totalPoints: $totalPoints, averagePoints: $averagePoints, rankCounts: $rankCounts, recent20Ranks: $recent20Ranks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRecordImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totalGames, totalGames) ||
                other.totalGames == totalGames) &&
            (identical(other.averageRank, averageRank) ||
                other.averageRank == averageRank) &&
            (identical(other.topTwoRate, topTwoRate) ||
                other.topTwoRate == topTwoRate) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.averagePoints, averagePoints) ||
                other.averagePoints == averagePoints) &&
            const DeepCollectionEquality()
                .equals(other._rankCounts, _rankCounts) &&
            const DeepCollectionEquality()
                .equals(other._recent20Ranks, _recent20Ranks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      totalGames,
      averageRank,
      topTwoRate,
      totalPoints,
      averagePoints,
      const DeepCollectionEquality().hash(_rankCounts),
      const DeepCollectionEquality().hash(_recent20Ranks));

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRecordImplCopyWith<_$GameRecordImpl> get copyWith =>
      __$$GameRecordImplCopyWithImpl<_$GameRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRecordImplToJson(
      this,
    );
  }
}

abstract class _GameRecord extends GameRecord {
  const factory _GameRecord(
      {required final MatchType type,
      required final int totalGames,
      required final double averageRank,
      required final double topTwoRate,
      required final int totalPoints,
      required final double averagePoints,
      required final List<int> rankCounts,
      required final List<int> recent20Ranks}) = _$GameRecordImpl;
  const _GameRecord._() : super._();

  factory _GameRecord.fromJson(Map<String, dynamic> json) =
      _$GameRecordImpl.fromJson;

  @override
  MatchType get type;
  @override
  int get totalGames;
  @override
  double get averageRank;
  @override
  double get topTwoRate;
  @override
  int get totalPoints;
  @override
  double get averagePoints;
  @override
  List<int> get rankCounts;
  @override
  List<int> get recent20Ranks;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameRecordImplCopyWith<_$GameRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
