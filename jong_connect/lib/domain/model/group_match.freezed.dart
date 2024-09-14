// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupMatch _$GroupMatchFromJson(Map<String, dynamic> json) {
  return _GroupMatch.fromJson(json);
}

/// @nodoc
mixin _$GroupMatch {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_type')
  MatchType get matchType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups')
  Group? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  AppUser? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  DateTime? get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_match_results')
  List<GroupMatchResult>? get results => throw _privateConstructorUsedError;

  /// Serializes this GroupMatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupMatchCopyWith<GroupMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupMatchCopyWith<$Res> {
  factory $GroupMatchCopyWith(
          GroupMatch value, $Res Function(GroupMatch) then) =
      _$GroupMatchCopyWithImpl<$Res, GroupMatch>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_type') MatchType matchType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'groups') Group? group,
      @JsonKey(name: 'users') AppUser? createdBy,
      @JsonKey(name: 'end_at') DateTime? endAt,
      @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results});

  $GroupCopyWith<$Res>? get group;
  $AppUserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$GroupMatchCopyWithImpl<$Res, $Val extends GroupMatch>
    implements $GroupMatchCopyWith<$Res> {
  _$GroupMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchType = null,
    Object? createdAt = null,
    Object? groupId = null,
    Object? group = freezed,
    Object? createdBy = freezed,
    Object? endAt = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as MatchType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GroupMatchResult>?,
    ) as $Val);
  }

  /// Create a copy of GroupMatch
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

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupMatchImplCopyWith<$Res>
    implements $GroupMatchCopyWith<$Res> {
  factory _$$GroupMatchImplCopyWith(
          _$GroupMatchImpl value, $Res Function(_$GroupMatchImpl) then) =
      __$$GroupMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_type') MatchType matchType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'groups') Group? group,
      @JsonKey(name: 'users') AppUser? createdBy,
      @JsonKey(name: 'end_at') DateTime? endAt,
      @JsonKey(name: 'group_match_results') List<GroupMatchResult>? results});

  @override
  $GroupCopyWith<$Res>? get group;
  @override
  $AppUserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$GroupMatchImplCopyWithImpl<$Res>
    extends _$GroupMatchCopyWithImpl<$Res, _$GroupMatchImpl>
    implements _$$GroupMatchImplCopyWith<$Res> {
  __$$GroupMatchImplCopyWithImpl(
      _$GroupMatchImpl _value, $Res Function(_$GroupMatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchType = null,
    Object? createdAt = null,
    Object? groupId = null,
    Object? group = freezed,
    Object? createdBy = freezed,
    Object? endAt = freezed,
    Object? results = freezed,
  }) {
    return _then(_$GroupMatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as MatchType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GroupMatchResult>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GroupMatchImpl extends _GroupMatch {
  const _$GroupMatchImpl(
      {required this.id,
      @JsonKey(name: 'match_type') required this.matchType,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'group_id') required this.groupId,
      @JsonKey(name: 'groups') this.group,
      @JsonKey(name: 'users') this.createdBy,
      @JsonKey(name: 'end_at') this.endAt,
      @JsonKey(name: 'group_match_results')
      final List<GroupMatchResult>? results})
      : _results = results,
        super._();

  factory _$GroupMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupMatchImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'match_type')
  final MatchType matchType;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'group_id')
  final int groupId;
  @override
  @JsonKey(name: 'groups')
  final Group? group;
  @override
  @JsonKey(name: 'users')
  final AppUser? createdBy;
  @override
  @JsonKey(name: 'end_at')
  final DateTime? endAt;
  final List<GroupMatchResult>? _results;
  @override
  @JsonKey(name: 'group_match_results')
  List<GroupMatchResult>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupMatch(id: $id, matchType: $matchType, createdAt: $createdAt, groupId: $groupId, group: $group, createdBy: $createdBy, endAt: $endAt, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupMatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchType, matchType) ||
                other.matchType == matchType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      matchType,
      createdAt,
      groupId,
      group,
      createdBy,
      endAt,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupMatchImplCopyWith<_$GroupMatchImpl> get copyWith =>
      __$$GroupMatchImplCopyWithImpl<_$GroupMatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupMatchImplToJson(
      this,
    );
  }
}

abstract class _GroupMatch extends GroupMatch {
  const factory _GroupMatch(
      {required final int id,
      @JsonKey(name: 'match_type') required final MatchType matchType,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'group_id') required final int groupId,
      @JsonKey(name: 'groups') final Group? group,
      @JsonKey(name: 'users') final AppUser? createdBy,
      @JsonKey(name: 'end_at') final DateTime? endAt,
      @JsonKey(name: 'group_match_results')
      final List<GroupMatchResult>? results}) = _$GroupMatchImpl;
  const _GroupMatch._() : super._();

  factory _GroupMatch.fromJson(Map<String, dynamic> json) =
      _$GroupMatchImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'match_type')
  MatchType get matchType;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'group_id')
  int get groupId;
  @override
  @JsonKey(name: 'groups')
  Group? get group;
  @override
  @JsonKey(name: 'users')
  AppUser? get createdBy;
  @override
  @JsonKey(name: 'end_at')
  DateTime? get endAt;
  @override
  @JsonKey(name: 'group_match_results')
  List<GroupMatchResult>? get results;

  /// Create a copy of GroupMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupMatchImplCopyWith<_$GroupMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
