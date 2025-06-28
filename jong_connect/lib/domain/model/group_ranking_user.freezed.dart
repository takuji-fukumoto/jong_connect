// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_ranking_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupRankingUser _$GroupRankingUserFromJson(Map<String, dynamic> json) {
  return _GroupRankingUser.fromJson(json);
}

/// @nodoc
mixin _$GroupRankingUser {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rank')
  double get averageRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_games')
  int get totalGames => throw _privateConstructorUsedError;

  /// Serializes this GroupRankingUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupRankingUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRankingUserCopyWith<GroupRankingUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRankingUserCopyWith<$Res> {
  factory $GroupRankingUserCopyWith(
          GroupRankingUser value, $Res Function(GroupRankingUser) then) =
      _$GroupRankingUserCopyWithImpl<$Res, GroupRankingUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'average_rank') double averageRank,
      @JsonKey(name: 'total_games') int totalGames});
}

/// @nodoc
class _$GroupRankingUserCopyWithImpl<$Res, $Val extends GroupRankingUser>
    implements $GroupRankingUserCopyWith<$Res> {
  _$GroupRankingUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRankingUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? averageRank = null,
    Object? totalGames = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GroupRankingUserImplCopyWith<$Res>
    implements $GroupRankingUserCopyWith<$Res> {
  factory _$$GroupRankingUserImplCopyWith(_$GroupRankingUserImpl value,
          $Res Function(_$GroupRankingUserImpl) then) =
      __$$GroupRankingUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'average_rank') double averageRank,
      @JsonKey(name: 'total_games') int totalGames});
}

/// @nodoc
class __$$GroupRankingUserImplCopyWithImpl<$Res>
    extends _$GroupRankingUserCopyWithImpl<$Res, _$GroupRankingUserImpl>
    implements _$$GroupRankingUserImplCopyWith<$Res> {
  __$$GroupRankingUserImplCopyWithImpl(_$GroupRankingUserImpl _value,
      $Res Function(_$GroupRankingUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRankingUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPoints = null,
    Object? averageRank = null,
    Object? totalGames = null,
  }) {
    return _then(_$GroupRankingUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
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
class _$GroupRankingUserImpl extends _GroupRankingUser {
  const _$GroupRankingUserImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'total_points') required this.totalPoints,
      @JsonKey(name: 'average_rank') required this.averageRank,
      @JsonKey(name: 'total_games') required this.totalGames})
      : super._();

  factory _$GroupRankingUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRankingUserImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'total_points')
  final int totalPoints;
  @override
  @JsonKey(name: 'average_rank')
  final double averageRank;
  @override
  @JsonKey(name: 'total_games')
  final int totalGames;

  @override
  String toString() {
    return 'GroupRankingUser(userId: $userId, totalPoints: $totalPoints, averageRank: $averageRank, totalGames: $totalGames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRankingUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.averageRank, averageRank) ||
                other.averageRank == averageRank) &&
            (identical(other.totalGames, totalGames) ||
                other.totalGames == totalGames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, totalPoints, averageRank, totalGames);

  /// Create a copy of GroupRankingUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRankingUserImplCopyWith<_$GroupRankingUserImpl> get copyWith =>
      __$$GroupRankingUserImplCopyWithImpl<_$GroupRankingUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupRankingUserImplToJson(
      this,
    );
  }
}

abstract class _GroupRankingUser extends GroupRankingUser {
  const factory _GroupRankingUser(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'total_points') required final int totalPoints,
          @JsonKey(name: 'average_rank') required final double averageRank,
          @JsonKey(name: 'total_games') required final int totalGames}) =
      _$GroupRankingUserImpl;
  const _GroupRankingUser._() : super._();

  factory _GroupRankingUser.fromJson(Map<String, dynamic> json) =
      _$GroupRankingUserImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'total_points')
  int get totalPoints;
  @override
  @JsonKey(name: 'average_rank')
  double get averageRank;
  @override
  @JsonKey(name: 'total_games')
  int get totalGames;

  /// Create a copy of GroupRankingUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRankingUserImplCopyWith<_$GroupRankingUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
