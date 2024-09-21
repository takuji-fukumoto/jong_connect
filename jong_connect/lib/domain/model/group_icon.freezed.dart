// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupIcon _$GroupIconFromJson(Map<String, dynamic> json) {
  return _GroupIcon.fromJson(json);
}

/// @nodoc
mixin _$GroupIcon {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this GroupIcon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupIcon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupIconCopyWith<GroupIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupIconCopyWith<$Res> {
  factory $GroupIconCopyWith(GroupIcon value, $Res Function(GroupIcon) then) =
      _$GroupIconCopyWithImpl<$Res, GroupIcon>;
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class _$GroupIconCopyWithImpl<$Res, $Val extends GroupIcon>
    implements $GroupIconCopyWith<$Res> {
  _$GroupIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupIcon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupIconImplCopyWith<$Res>
    implements $GroupIconCopyWith<$Res> {
  factory _$$GroupIconImplCopyWith(
          _$GroupIconImpl value, $Res Function(_$GroupIconImpl) then) =
      __$$GroupIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class __$$GroupIconImplCopyWithImpl<$Res>
    extends _$GroupIconCopyWithImpl<$Res, _$GroupIconImpl>
    implements _$$GroupIconImplCopyWith<$Res> {
  __$$GroupIconImplCopyWithImpl(
      _$GroupIconImpl _value, $Res Function(_$GroupIconImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupIcon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$GroupIconImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupIconImpl implements _GroupIcon {
  const _$GroupIconImpl({required this.id, required this.url});

  factory _$GroupIconImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupIconImplFromJson(json);

  @override
  final int id;
  @override
  final String url;

  @override
  String toString() {
    return 'GroupIcon(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupIconImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  /// Create a copy of GroupIcon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupIconImplCopyWith<_$GroupIconImpl> get copyWith =>
      __$$GroupIconImplCopyWithImpl<_$GroupIconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupIconImplToJson(
      this,
    );
  }
}

abstract class _GroupIcon implements GroupIcon {
  const factory _GroupIcon({required final int id, required final String url}) =
      _$GroupIconImpl;

  factory _GroupIcon.fromJson(Map<String, dynamic> json) =
      _$GroupIconImpl.fromJson;

  @override
  int get id;
  @override
  String get url;

  /// Create a copy of GroupIcon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupIconImplCopyWith<_$GroupIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
