// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_ranking_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupRankingItem _$GroupRankingItemFromJson(Map<String, dynamic> json) {
  return _GroupRankingItem.fromJson(json);
}

/// @nodoc
mixin _$GroupRankingItem {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_score')
  int get totalScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rank')
  double get averageRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_games')
  int get totalGames => throw _privateConstructorUsedError;

  /// Serializes this GroupRankingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupRankingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRankingItemCopyWith<GroupRankingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRankingItemCopyWith<$Res> {
  factory $GroupRankingItemCopyWith(
          GroupRankingItem value, $Res Function(GroupRankingItem) then) =
      _$GroupRankingItemCopyWithImpl<$Res, GroupRankingItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'total_score') int totalScore,
      @JsonKey(name: 'average_rank') double averageRank,
      @JsonKey(name: 'total_games') int totalGames});
}

/// @nodoc
class _$GroupRankingItemCopyWithImpl<$Res, $Val extends GroupRankingItem>
    implements $GroupRankingItemCopyWith<$Res> {
  _$GroupRankingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRankingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalScore = null,
    Object? averageRank = null,
    Object? totalGames = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      averageRank: null == averageRank
          ? _value.averageRank
          : averageRank // ignore: cast_nullable_to_non_nullable
              as double,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupRankingItemImplCopyWith<$Res>
    implements $GroupRankingItemCopyWith<$Res> {
  factory _$$GroupRankingItemImplCopyWith(_$GroupRankingItemImpl value,
          $Res Function(_$GroupRankingItemImpl) then) =
      __$$GroupRankingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'total_score') int totalScore,
      @JsonKey(name: 'average_rank') double averageRank,
      @JsonKey(name: 'total_games') int totalGames});
}

/// @nodoc
class __$$GroupRankingItemImplCopyWithImpl<$Res>
    extends _$GroupRankingItemCopyWithImpl<$Res, _$GroupRankingItemImpl>
    implements _$$GroupRankingItemImplCopyWith<$Res> {
  __$$GroupRankingItemImplCopyWithImpl(_$GroupRankingItemImpl _value,
      $Res Function(_$GroupRankingItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRankingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalScore = null,
    Object? averageRank = null,
    Object? totalGames = null,
  }) {
    return _then(_$GroupRankingItemImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      averageRank: null == averageRank
          ? _value.averageRank
          : averageRank // ignore: cast_nullable_to_non_nullable
              as double,
      totalGames: null == totalGames
          ? _value.totalGames
          : totalGames // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GroupRankingItemImpl extends _GroupRankingItem {
  const _$GroupRankingItemImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'total_score') required this.totalScore,
      @JsonKey(name: 'average_rank') required this.averageRank,
      @JsonKey(name: 'total_games') required this.totalGames})
      : super._();

  factory _$GroupRankingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRankingItemImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'total_score')
  final int totalScore;
  @override
  @JsonKey(name: 'average_rank')
  final double averageRank;
  @override
  @JsonKey(name: 'total_games')
  final int totalGames;

  @override
  String toString() {
    return 'GroupRankingItem(userId: $userId, totalScore: $totalScore, averageRank: $averageRank, totalGames: $totalGames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRankingItemImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.averageRank, averageRank) ||
                other.averageRank == averageRank) &&
            (identical(other.totalGames, totalGames) ||
                other.totalGames == totalGames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, totalScore, averageRank, totalGames);

  /// Create a copy of GroupRankingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRankingItemImplCopyWith<_$GroupRankingItemImpl> get copyWith =>
      __$$GroupRankingItemImplCopyWithImpl<_$GroupRankingItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupRankingItemImplToJson(
      this,
    );
  }
}

abstract class _GroupRankingItem extends GroupRankingItem {
  const factory _GroupRankingItem(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'total_score') required final int totalScore,
          @JsonKey(name: 'average_rank') required final double averageRank,
          @JsonKey(name: 'total_games') required final int totalGames}) =
      _$GroupRankingItemImpl;
  const _GroupRankingItem._() : super._();

  factory _GroupRankingItem.fromJson(Map<String, dynamic> json) =
      _$GroupRankingItemImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'total_score')
  int get totalScore;
  @override
  @JsonKey(name: 'average_rank')
  double get averageRank;
  @override
  @JsonKey(name: 'total_games')
  int get totalGames;

  /// Create a copy of GroupRankingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRankingItemImplCopyWith<_$GroupRankingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
