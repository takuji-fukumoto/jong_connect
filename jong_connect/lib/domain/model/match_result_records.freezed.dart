// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_result_records.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchResultRecords _$MatchResultRecordsFromJson(Map<String, dynamic> json) {
  return _MatchResultRecords.fromJson(json);
}

/// @nodoc
mixin _$MatchResultRecords {
  int get groupId => throw _privateConstructorUsedError;
  MatchType get matchType => throw _privateConstructorUsedError;
  List<GroupMatchResult> get results => throw _privateConstructorUsedError;

  /// Serializes this MatchResultRecords to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchResultRecords
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchResultRecordsCopyWith<MatchResultRecords> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchResultRecordsCopyWith<$Res> {
  factory $MatchResultRecordsCopyWith(
          MatchResultRecords value, $Res Function(MatchResultRecords) then) =
      _$MatchResultRecordsCopyWithImpl<$Res, MatchResultRecords>;
  @useResult
  $Res call({int groupId, MatchType matchType, List<GroupMatchResult> results});
}

/// @nodoc
class _$MatchResultRecordsCopyWithImpl<$Res, $Val extends MatchResultRecords>
    implements $MatchResultRecordsCopyWith<$Res> {
  _$MatchResultRecordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchResultRecords
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? matchType = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as MatchType,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GroupMatchResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchResultRecordsImplCopyWith<$Res>
    implements $MatchResultRecordsCopyWith<$Res> {
  factory _$$MatchResultRecordsImplCopyWith(_$MatchResultRecordsImpl value,
          $Res Function(_$MatchResultRecordsImpl) then) =
      __$$MatchResultRecordsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int groupId, MatchType matchType, List<GroupMatchResult> results});
}

/// @nodoc
class __$$MatchResultRecordsImplCopyWithImpl<$Res>
    extends _$MatchResultRecordsCopyWithImpl<$Res, _$MatchResultRecordsImpl>
    implements _$$MatchResultRecordsImplCopyWith<$Res> {
  __$$MatchResultRecordsImplCopyWithImpl(_$MatchResultRecordsImpl _value,
      $Res Function(_$MatchResultRecordsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchResultRecords
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? matchType = null,
    Object? results = null,
  }) {
    return _then(_$MatchResultRecordsImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as MatchType,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GroupMatchResult>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MatchResultRecordsImpl extends _MatchResultRecords {
  const _$MatchResultRecordsImpl(
      {required this.groupId,
      required this.matchType,
      final List<GroupMatchResult> results = const []})
      : _results = results,
        super._();

  factory _$MatchResultRecordsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchResultRecordsImplFromJson(json);

  @override
  final int groupId;
  @override
  final MatchType matchType;
  final List<GroupMatchResult> _results;
  @override
  @JsonKey()
  List<GroupMatchResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MatchResultRecords(groupId: $groupId, matchType: $matchType, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchResultRecordsImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.matchType, matchType) ||
                other.matchType == matchType) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, matchType,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of MatchResultRecords
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchResultRecordsImplCopyWith<_$MatchResultRecordsImpl> get copyWith =>
      __$$MatchResultRecordsImplCopyWithImpl<_$MatchResultRecordsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchResultRecordsImplToJson(
      this,
    );
  }
}

abstract class _MatchResultRecords extends MatchResultRecords {
  const factory _MatchResultRecords(
      {required final int groupId,
      required final MatchType matchType,
      final List<GroupMatchResult> results}) = _$MatchResultRecordsImpl;
  const _MatchResultRecords._() : super._();

  factory _MatchResultRecords.fromJson(Map<String, dynamic> json) =
      _$MatchResultRecordsImpl.fromJson;

  @override
  int get groupId;
  @override
  MatchType get matchType;
  @override
  List<GroupMatchResult> get results;

  /// Create a copy of MatchResultRecords
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchResultRecordsImplCopyWith<_$MatchResultRecordsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
