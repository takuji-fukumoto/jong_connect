// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'joined_group_match_players.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JoinedGroupMatchPlayers _$JoinedGroupMatchPlayersFromJson(
    Map<String, dynamic> json) {
  return _JoinedGroupMatchPlayers.fromJson(json);
}

/// @nodoc
mixin _$JoinedGroupMatchPlayers {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  AppUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_match')
  GroupMatch? get groupMatch => throw _privateConstructorUsedError;

  /// Serializes this JoinedGroupMatchPlayers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinedGroupMatchPlayersCopyWith<JoinedGroupMatchPlayers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinedGroupMatchPlayersCopyWith<$Res> {
  factory $JoinedGroupMatchPlayersCopyWith(JoinedGroupMatchPlayers value,
          $Res Function(JoinedGroupMatchPlayers) then) =
      _$JoinedGroupMatchPlayersCopyWithImpl<$Res, JoinedGroupMatchPlayers>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user') AppUser? user,
      @JsonKey(name: 'group_match') GroupMatch? groupMatch});

  $AppUserCopyWith<$Res>? get user;
  $GroupMatchCopyWith<$Res>? get groupMatch;
}

/// @nodoc
class _$JoinedGroupMatchPlayersCopyWithImpl<$Res,
        $Val extends JoinedGroupMatchPlayers>
    implements $JoinedGroupMatchPlayersCopyWith<$Res> {
  _$JoinedGroupMatchPlayersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? groupMatch = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      groupMatch: freezed == groupMatch
          ? _value.groupMatch
          : groupMatch // ignore: cast_nullable_to_non_nullable
              as GroupMatch?,
    ) as $Val);
  }

  /// Create a copy of JoinedGroupMatchPlayers
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

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupMatchCopyWith<$Res>? get groupMatch {
    if (_value.groupMatch == null) {
      return null;
    }

    return $GroupMatchCopyWith<$Res>(_value.groupMatch!, (value) {
      return _then(_value.copyWith(groupMatch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JoinedGroupMatchPlayersImplCopyWith<$Res>
    implements $JoinedGroupMatchPlayersCopyWith<$Res> {
  factory _$$JoinedGroupMatchPlayersImplCopyWith(
          _$JoinedGroupMatchPlayersImpl value,
          $Res Function(_$JoinedGroupMatchPlayersImpl) then) =
      __$$JoinedGroupMatchPlayersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user') AppUser? user,
      @JsonKey(name: 'group_match') GroupMatch? groupMatch});

  @override
  $AppUserCopyWith<$Res>? get user;
  @override
  $GroupMatchCopyWith<$Res>? get groupMatch;
}

/// @nodoc
class __$$JoinedGroupMatchPlayersImplCopyWithImpl<$Res>
    extends _$JoinedGroupMatchPlayersCopyWithImpl<$Res,
        _$JoinedGroupMatchPlayersImpl>
    implements _$$JoinedGroupMatchPlayersImplCopyWith<$Res> {
  __$$JoinedGroupMatchPlayersImplCopyWithImpl(
      _$JoinedGroupMatchPlayersImpl _value,
      $Res Function(_$JoinedGroupMatchPlayersImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? groupMatch = freezed,
  }) {
    return _then(_$JoinedGroupMatchPlayersImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      groupMatch: freezed == groupMatch
          ? _value.groupMatch
          : groupMatch // ignore: cast_nullable_to_non_nullable
              as GroupMatch?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinedGroupMatchPlayersImpl implements _JoinedGroupMatchPlayers {
  const _$JoinedGroupMatchPlayersImpl(
      {required this.id,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'group_match') this.groupMatch});

  factory _$JoinedGroupMatchPlayersImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinedGroupMatchPlayersImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user')
  final AppUser? user;
  @override
  @JsonKey(name: 'group_match')
  final GroupMatch? groupMatch;

  @override
  String toString() {
    return 'JoinedGroupMatchPlayers(id: $id, user: $user, groupMatch: $groupMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinedGroupMatchPlayersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.groupMatch, groupMatch) ||
                other.groupMatch == groupMatch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, groupMatch);

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinedGroupMatchPlayersImplCopyWith<_$JoinedGroupMatchPlayersImpl>
      get copyWith => __$$JoinedGroupMatchPlayersImplCopyWithImpl<
          _$JoinedGroupMatchPlayersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinedGroupMatchPlayersImplToJson(
      this,
    );
  }
}

abstract class _JoinedGroupMatchPlayers implements JoinedGroupMatchPlayers {
  const factory _JoinedGroupMatchPlayers(
          {required final int id,
          @JsonKey(name: 'user') final AppUser? user,
          @JsonKey(name: 'group_match') final GroupMatch? groupMatch}) =
      _$JoinedGroupMatchPlayersImpl;

  factory _JoinedGroupMatchPlayers.fromJson(Map<String, dynamic> json) =
      _$JoinedGroupMatchPlayersImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user')
  AppUser? get user;
  @override
  @JsonKey(name: 'group_match')
  GroupMatch? get groupMatch;

  /// Create a copy of JoinedGroupMatchPlayers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinedGroupMatchPlayersImplCopyWith<_$JoinedGroupMatchPlayersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
