// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupRanking _$GroupRankingFromJson(Map<String, dynamic> json) {
  return _GroupRanking.fromJson(json);
}

/// @nodoc
mixin _$GroupRanking {
  @JsonKey(name: 'ranking_items')
  List<GroupRankingItem> get rankingItems => throw _privateConstructorUsedError;

  /// Serializes this GroupRanking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupRanking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRankingCopyWith<GroupRanking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRankingCopyWith<$Res> {
  factory $GroupRankingCopyWith(
          GroupRanking value, $Res Function(GroupRanking) then) =
      _$GroupRankingCopyWithImpl<$Res, GroupRanking>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ranking_items') List<GroupRankingItem> rankingItems});
}

/// @nodoc
class _$GroupRankingCopyWithImpl<$Res, $Val extends GroupRanking>
    implements $GroupRankingCopyWith<$Res> {
  _$GroupRankingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRanking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankingItems = null,
  }) {
    return _then(_value.copyWith(
      rankingItems: null == rankingItems
          ? _value.rankingItems
          : rankingItems // ignore: cast_nullable_to_non_nullable
              as List<GroupRankingItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupRankingImplCopyWith<$Res>
    implements $GroupRankingCopyWith<$Res> {
  factory _$$GroupRankingImplCopyWith(
          _$GroupRankingImpl value, $Res Function(_$GroupRankingImpl) then) =
      __$$GroupRankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ranking_items') List<GroupRankingItem> rankingItems});
}

/// @nodoc
class __$$GroupRankingImplCopyWithImpl<$Res>
    extends _$GroupRankingCopyWithImpl<$Res, _$GroupRankingImpl>
    implements _$$GroupRankingImplCopyWith<$Res> {
  __$$GroupRankingImplCopyWithImpl(
      _$GroupRankingImpl _value, $Res Function(_$GroupRankingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRanking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankingItems = null,
  }) {
    return _then(_$GroupRankingImpl(
      rankingItems: null == rankingItems
          ? _value._rankingItems
          : rankingItems // ignore: cast_nullable_to_non_nullable
              as List<GroupRankingItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GroupRankingImpl extends _GroupRanking {
  const _$GroupRankingImpl(
      {@JsonKey(name: 'ranking_items')
      required final List<GroupRankingItem> rankingItems})
      : _rankingItems = rankingItems,
        super._();

  factory _$GroupRankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRankingImplFromJson(json);

  final List<GroupRankingItem> _rankingItems;
  @override
  @JsonKey(name: 'ranking_items')
  List<GroupRankingItem> get rankingItems {
    if (_rankingItems is EqualUnmodifiableListView) return _rankingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankingItems);
  }

  @override
  String toString() {
    return 'GroupRanking(rankingItems: $rankingItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRankingImpl &&
            const DeepCollectionEquality()
                .equals(other._rankingItems, _rankingItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rankingItems));

  /// Create a copy of GroupRanking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRankingImplCopyWith<_$GroupRankingImpl> get copyWith =>
      __$$GroupRankingImplCopyWithImpl<_$GroupRankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupRankingImplToJson(
      this,
    );
  }
}

abstract class _GroupRanking extends GroupRanking {
  const factory _GroupRanking(
      {@JsonKey(name: 'ranking_items')
      required final List<GroupRankingItem> rankingItems}) = _$GroupRankingImpl;
  const _GroupRanking._() : super._();

  factory _GroupRanking.fromJson(Map<String, dynamic> json) =
      _$GroupRankingImpl.fromJson;

  @override
  @JsonKey(name: 'ranking_items')
  List<GroupRankingItem> get rankingItems;

  /// Create a copy of GroupRanking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRankingImplCopyWith<_$GroupRankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
