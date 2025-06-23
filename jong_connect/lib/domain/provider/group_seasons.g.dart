// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_seasons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupSeasonsHash() => r'833de0457e59b38e9d4cb95f23c51164ab8eb5e5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [groupSeasons].
@ProviderFor(groupSeasons)
const groupSeasonsProvider = GroupSeasonsFamily();

/// See also [groupSeasons].
class GroupSeasonsFamily extends Family<AsyncValue<List<Season>>> {
  /// See also [groupSeasons].
  const GroupSeasonsFamily();

  /// See also [groupSeasons].
  GroupSeasonsProvider call({
    required int groupId,
  }) {
    return GroupSeasonsProvider(
      groupId: groupId,
    );
  }

  @override
  GroupSeasonsProvider getProviderOverride(
    covariant GroupSeasonsProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupSeasonsProvider';
}

/// See also [groupSeasons].
class GroupSeasonsProvider extends AutoDisposeFutureProvider<List<Season>> {
  /// See also [groupSeasons].
  GroupSeasonsProvider({
    required int groupId,
  }) : this._internal(
          (ref) => groupSeasons(
            ref as GroupSeasonsRef,
            groupId: groupId,
          ),
          from: groupSeasonsProvider,
          name: r'groupSeasonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupSeasonsHash,
          dependencies: GroupSeasonsFamily._dependencies,
          allTransitiveDependencies:
              GroupSeasonsFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupSeasonsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final int groupId;

  @override
  Override overrideWith(
    FutureOr<List<Season>> Function(GroupSeasonsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupSeasonsProvider._internal(
        (ref) => create(ref as GroupSeasonsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Season>> createElement() {
    return _GroupSeasonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupSeasonsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupSeasonsRef on AutoDisposeFutureProviderRef<List<Season>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _GroupSeasonsProviderElement
    extends AutoDisposeFutureProviderElement<List<Season>>
    with GroupSeasonsRef {
  _GroupSeasonsProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupSeasonsProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
