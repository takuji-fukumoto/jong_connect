// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_joined_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserJoinedGroup _$UserJoinedGroupFromJson(Map<String, dynamic> json) {
  return _UserJoinedGroup.fromJson(json);
}

/// @nodoc
mixin _$UserJoinedGroup {
  @JsonKey(name: 'users')
  AppUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups')
  Group? get group => throw _privateConstructorUsedError;

  /// Serializes this UserJoinedGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserJoinedGroupCopyWith<UserJoinedGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJoinedGroupCopyWith<$Res> {
  factory $UserJoinedGroupCopyWith(
          UserJoinedGroup value, $Res Function(UserJoinedGroup) then) =
      _$UserJoinedGroupCopyWithImpl<$Res, UserJoinedGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'users') AppUser? user,
      @JsonKey(name: 'groups') Group? group});

  $AppUserCopyWith<$Res>? get user;
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class _$UserJoinedGroupCopyWithImpl<$Res, $Val extends UserJoinedGroup>
    implements $UserJoinedGroupCopyWith<$Res> {
  _$UserJoinedGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ) as $Val);
  }

  /// Create a copy of UserJoinedGroup
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

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserJoinedGroupImplCopyWith<$Res>
    implements $UserJoinedGroupCopyWith<$Res> {
  factory _$$UserJoinedGroupImplCopyWith(_$UserJoinedGroupImpl value,
          $Res Function(_$UserJoinedGroupImpl) then) =
      __$$UserJoinedGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'users') AppUser? user,
      @JsonKey(name: 'groups') Group? group});

  @override
  $AppUserCopyWith<$Res>? get user;
  @override
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class __$$UserJoinedGroupImplCopyWithImpl<$Res>
    extends _$UserJoinedGroupCopyWithImpl<$Res, _$UserJoinedGroupImpl>
    implements _$$UserJoinedGroupImplCopyWith<$Res> {
  __$$UserJoinedGroupImplCopyWithImpl(
      _$UserJoinedGroupImpl _value, $Res Function(_$UserJoinedGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? group = freezed,
  }) {
    return _then(_$UserJoinedGroupImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJoinedGroupImpl implements _UserJoinedGroup {
  const _$UserJoinedGroupImpl(
      {@JsonKey(name: 'users') this.user, @JsonKey(name: 'groups') this.group});

  factory _$UserJoinedGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJoinedGroupImplFromJson(json);

  @override
  @JsonKey(name: 'users')
  final AppUser? user;
  @override
  @JsonKey(name: 'groups')
  final Group? group;

  @override
  String toString() {
    return 'UserJoinedGroup(user: $user, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJoinedGroupImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, group);

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJoinedGroupImplCopyWith<_$UserJoinedGroupImpl> get copyWith =>
      __$$UserJoinedGroupImplCopyWithImpl<_$UserJoinedGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJoinedGroupImplToJson(
      this,
    );
  }
}

abstract class _UserJoinedGroup implements UserJoinedGroup {
  const factory _UserJoinedGroup(
      {@JsonKey(name: 'users') final AppUser? user,
      @JsonKey(name: 'groups') final Group? group}) = _$UserJoinedGroupImpl;

  factory _UserJoinedGroup.fromJson(Map<String, dynamic> json) =
      _$UserJoinedGroupImpl.fromJson;

  @override
  @JsonKey(name: 'users')
  AppUser? get user;
  @override
  @JsonKey(name: 'groups')
  Group? get group;

  /// Create a copy of UserJoinedGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserJoinedGroupImplCopyWith<_$UserJoinedGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
