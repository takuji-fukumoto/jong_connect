// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_matches.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchesHash() => r'016b8fdb59c11c07fa8d0001415d74e73b960b7a';

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

/// See also [groupMatches].
@ProviderFor(groupMatches)
const groupMatchesProvider = GroupMatchesFamily();

/// See also [groupMatches].
class GroupMatchesFamily extends Family<AsyncValue<List<GroupMatch>>> {
  /// See also [groupMatches].
  const GroupMatchesFamily();

  /// See also [groupMatches].
  GroupMatchesProvider call({
    required int groupId,
  }) {
    return GroupMatchesProvider(
      groupId: groupId,
    );
  }

  @override
  GroupMatchesProvider getProviderOverride(
    covariant GroupMatchesProvider provider,
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
  String? get name => r'groupMatchesProvider';
}

/// See also [groupMatches].
class GroupMatchesProvider extends AutoDisposeFutureProvider<List<GroupMatch>> {
  /// See also [groupMatches].
  GroupMatchesProvider({
    required int groupId,
  }) : this._internal(
          (ref) => groupMatches(
            ref as GroupMatchesRef,
            groupId: groupId,
          ),
          from: groupMatchesProvider,
          name: r'groupMatchesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchesHash,
          dependencies: GroupMatchesFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchesFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupMatchesProvider._internal(
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
    FutureOr<List<GroupMatch>> Function(GroupMatchesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchesProvider._internal(
        (ref) => create(ref as GroupMatchesRef),
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
  AutoDisposeFutureProviderElement<List<GroupMatch>> createElement() {
    return _GroupMatchesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchesProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchesRef on AutoDisposeFutureProviderRef<List<GroupMatch>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _GroupMatchesProviderElement
    extends AutoDisposeFutureProviderElement<List<GroupMatch>>
    with GroupMatchesRef {
  _GroupMatchesProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupMatchesProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
