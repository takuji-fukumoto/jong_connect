// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_friend_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFriendRequest _$UserFriendRequestFromJson(Map<String, dynamic> json) {
  return _UserFriendRequest.fromJson(json);
}

/// @nodoc
mixin _$UserFriendRequest {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'friend_id')
  int get friendId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  AppUser? get targetUser => throw _privateConstructorUsedError;
  FriendRequestStatus get status => throw _privateConstructorUsedError;

  /// Serializes this UserFriendRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFriendRequestCopyWith<UserFriendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFriendRequestCopyWith<$Res> {
  factory $UserFriendRequestCopyWith(
          UserFriendRequest value, $Res Function(UserFriendRequest) then) =
      _$UserFriendRequestCopyWithImpl<$Res, UserFriendRequest>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'friend_id') int friendId,
      @JsonKey(name: 'user') AppUser? targetUser,
      FriendRequestStatus status});

  $AppUserCopyWith<$Res>? get targetUser;
}

/// @nodoc
class _$UserFriendRequestCopyWithImpl<$Res, $Val extends UserFriendRequest>
    implements $UserFriendRequestCopyWith<$Res> {
  _$UserFriendRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? friendId = null,
    Object? targetUser = freezed,
    Object? status = null,
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
      friendId: null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int,
      targetUser: freezed == targetUser
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FriendRequestStatus,
    ) as $Val);
  }

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get targetUser {
    if (_value.targetUser == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_value.targetUser!, (value) {
      return _then(_value.copyWith(targetUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserFriendRequestImplCopyWith<$Res>
    implements $UserFriendRequestCopyWith<$Res> {
  factory _$$UserFriendRequestImplCopyWith(_$UserFriendRequestImpl value,
          $Res Function(_$UserFriendRequestImpl) then) =
      __$$UserFriendRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'friend_id') int friendId,
      @JsonKey(name: 'user') AppUser? targetUser,
      FriendRequestStatus status});

  @override
  $AppUserCopyWith<$Res>? get targetUser;
}

/// @nodoc
class __$$UserFriendRequestImplCopyWithImpl<$Res>
    extends _$UserFriendRequestCopyWithImpl<$Res, _$UserFriendRequestImpl>
    implements _$$UserFriendRequestImplCopyWith<$Res> {
  __$$UserFriendRequestImplCopyWithImpl(_$UserFriendRequestImpl _value,
      $Res Function(_$UserFriendRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? friendId = null,
    Object? targetUser = freezed,
    Object? status = null,
  }) {
    return _then(_$UserFriendRequestImpl(
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
      friendId: null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int,
      targetUser: freezed == targetUser
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FriendRequestStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFriendRequestImpl implements _UserFriendRequest {
  const _$UserFriendRequestImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'friend_id') required this.friendId,
      @JsonKey(name: 'user') this.targetUser,
      required this.status});

  factory _$UserFriendRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFriendRequestImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'friend_id')
  final int friendId;
  @override
  @JsonKey(name: 'user')
  final AppUser? targetUser;
  @override
  final FriendRequestStatus status;

  @override
  String toString() {
    return 'UserFriendRequest(id: $id, userId: $userId, createdAt: $createdAt, friendId: $friendId, targetUser: $targetUser, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFriendRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.targetUser, targetUser) ||
                other.targetUser == targetUser) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, createdAt, friendId, targetUser, status);

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFriendRequestImplCopyWith<_$UserFriendRequestImpl> get copyWith =>
      __$$UserFriendRequestImplCopyWithImpl<_$UserFriendRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFriendRequestImplToJson(
      this,
    );
  }
}

abstract class _UserFriendRequest implements UserFriendRequest {
  const factory _UserFriendRequest(
      {required final int id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'friend_id') required final int friendId,
      @JsonKey(name: 'user') final AppUser? targetUser,
      required final FriendRequestStatus status}) = _$UserFriendRequestImpl;

  factory _UserFriendRequest.fromJson(Map<String, dynamic> json) =
      _$UserFriendRequestImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'friend_id')
  int get friendId;
  @override
  @JsonKey(name: 'user')
  AppUser? get targetUser;
  @override
  FriendRequestStatus get status;

  /// Create a copy of UserFriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFriendRequestImplCopyWith<_$UserFriendRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
