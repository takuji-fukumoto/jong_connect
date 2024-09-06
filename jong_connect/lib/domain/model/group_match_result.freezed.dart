// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_match_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupMatchResult _$GroupMatchResultFromJson(Map<String, dynamic> json) {
  return _GroupMatchResult.fromJson(json);
}

/// @nodoc
mixin _$GroupMatchResult {
  int get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_order')
  int get matchOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_match_id')
  int get groupMatchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  AppUser? get user => throw _privateConstructorUsedError;

  /// Serializes this GroupMatchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupMatchResultCopyWith<GroupMatchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupMatchResultCopyWith<$Res> {
  factory $GroupMatchResultCopyWith(
          GroupMatchResult value, $Res Function(GroupMatchResult) then) =
      _$GroupMatchResultCopyWithImpl<$Res, GroupMatchResult>;
  @useResult
  $Res call(
      {int id,
      int score,
      int rank,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'match_order') int matchOrder,
      @JsonKey(name: 'group_match_id') int groupMatchId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'users') AppUser? user});

  $AppUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GroupMatchResultCopyWithImpl<$Res, $Val extends GroupMatchResult>
    implements $GroupMatchResultCopyWith<$Res> {
  _$GroupMatchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? rank = null,
    Object? totalPoints = null,
    Object? matchOrder = null,
    Object? groupMatchId = null,
    Object? createdAt = null,
    Object? userName = null,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      matchOrder: null == matchOrder
          ? _value.matchOrder
          : matchOrder // ignore: cast_nullable_to_non_nullable
              as int,
      groupMatchId: null == groupMatchId
          ? _value.groupMatchId
          : groupMatchId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
    ) as $Val);
  }

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupMatchResultImplCopyWith<$Res>
    implements $GroupMatchResultCopyWith<$Res> {
  factory _$$GroupMatchResultImplCopyWith(_$GroupMatchResultImpl value,
          $Res Function(_$GroupMatchResultImpl) then) =
      __$$GroupMatchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int score,
      int rank,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'match_order') int matchOrder,
      @JsonKey(name: 'group_match_id') int groupMatchId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'users') AppUser? user});

  @override
  $AppUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GroupMatchResultImplCopyWithImpl<$Res>
    extends _$GroupMatchResultCopyWithImpl<$Res, _$GroupMatchResultImpl>
    implements _$$GroupMatchResultImplCopyWith<$Res> {
  __$$GroupMatchResultImplCopyWithImpl(_$GroupMatchResultImpl _value,
      $Res Function(_$GroupMatchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? rank = null,
    Object? totalPoints = null,
    Object? matchOrder = null,
    Object? groupMatchId = null,
    Object? createdAt = null,
    Object? userName = null,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_$GroupMatchResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      matchOrder: null == matchOrder
          ? _value.matchOrder
          : matchOrder // ignore: cast_nullable_to_non_nullable
              as int,
      groupMatchId: null == groupMatchId
          ? _value.groupMatchId
          : groupMatchId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupMatchResultImpl implements _GroupMatchResult {
  const _$GroupMatchResultImpl(
      {required this.id,
      required this.score,
      required this.rank,
      @JsonKey(name: 'total_points') required this.totalPoints,
      @JsonKey(name: 'match_order') required this.matchOrder,
      @JsonKey(name: 'group_match_id') required this.groupMatchId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'user_name') required this.userName,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'users') this.user});

  factory _$GroupMatchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupMatchResultImplFromJson(json);

  @override
  final int id;
  @override
  final int score;
  @override
  final int rank;
  @override
  @JsonKey(name: 'total_points')
  final int totalPoints;
  @override
  @JsonKey(name: 'match_order')
  final int matchOrder;
  @override
  @JsonKey(name: 'group_match_id')
  final int groupMatchId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'users')
  final AppUser? user;

  @override
  String toString() {
    return 'GroupMatchResult(id: $id, score: $score, rank: $rank, totalPoints: $totalPoints, matchOrder: $matchOrder, groupMatchId: $groupMatchId, createdAt: $createdAt, userName: $userName, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupMatchResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.matchOrder, matchOrder) ||
                other.matchOrder == matchOrder) &&
            (identical(other.groupMatchId, groupMatchId) ||
                other.groupMatchId == groupMatchId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, score, rank, totalPoints,
      matchOrder, groupMatchId, createdAt, userName, userId, user);

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupMatchResultImplCopyWith<_$GroupMatchResultImpl> get copyWith =>
      __$$GroupMatchResultImplCopyWithImpl<_$GroupMatchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupMatchResultImplToJson(
      this,
    );
  }
}

abstract class _GroupMatchResult implements GroupMatchResult {
  const factory _GroupMatchResult(
      {required final int id,
      required final int score,
      required final int rank,
      @JsonKey(name: 'total_points') required final int totalPoints,
      @JsonKey(name: 'match_order') required final int matchOrder,
      @JsonKey(name: 'group_match_id') required final int groupMatchId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'user_name') required final String userName,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'users') final AppUser? user}) = _$GroupMatchResultImpl;

  factory _GroupMatchResult.fromJson(Map<String, dynamic> json) =
      _$GroupMatchResultImpl.fromJson;

  @override
  int get id;
  @override
  int get score;
  @override
  int get rank;
  @override
  @JsonKey(name: 'total_points')
  int get totalPoints;
  @override
  @JsonKey(name: 'match_order')
  int get matchOrder;
  @override
  @JsonKey(name: 'group_match_id')
  int get groupMatchId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'users')
  AppUser? get user;

  /// Create a copy of GroupMatchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupMatchResultImplCopyWith<_$GroupMatchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
