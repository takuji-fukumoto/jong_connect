// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchHash() => r'e6e87e9998d3f7a5d34269f9e2de1418572ec46a';

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

/// See also [groupMatch].
@ProviderFor(groupMatch)
const groupMatchProvider = GroupMatchFamily();

/// See also [groupMatch].
class GroupMatchFamily extends Family<AsyncValue<GroupMatch>> {
  /// See also [groupMatch].
  const GroupMatchFamily();

  /// See also [groupMatch].
  GroupMatchProvider call({
    required int groupMatchId,
  }) {
    return GroupMatchProvider(
      groupMatchId: groupMatchId,
    );
  }

  @override
  GroupMatchProvider getProviderOverride(
    covariant GroupMatchProvider provider,
  ) {
    return call(
      groupMatchId: provider.groupMatchId,
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
  String? get name => r'groupMatchProvider';
}

/// See also [groupMatch].
class GroupMatchProvider extends AutoDisposeFutureProvider<GroupMatch> {
  /// See also [groupMatch].
  GroupMatchProvider({
    required int groupMatchId,
  }) : this._internal(
          (ref) => groupMatch(
            ref as GroupMatchRef,
            groupMatchId: groupMatchId,
          ),
          from: groupMatchProvider,
          name: r'groupMatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchHash,
          dependencies: GroupMatchFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchFamily._allTransitiveDependencies,
          groupMatchId: groupMatchId,
        );

  GroupMatchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupMatchId,
  }) : super.internal();

  final int groupMatchId;

  @override
  Override overrideWith(
    FutureOr<GroupMatch> Function(GroupMatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchProvider._internal(
        (ref) => create(ref as GroupMatchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupMatchId: groupMatchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupMatch> createElement() {
    return _GroupMatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchProvider && other.groupMatchId == groupMatchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupMatchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchRef on AutoDisposeFutureProviderRef<GroupMatch> {
  /// The parameter `groupMatchId` of this provider.
  int get groupMatchId;
}

class _GroupMatchProviderElement
    extends AutoDisposeFutureProviderElement<GroupMatch> with GroupMatchRef {
  _GroupMatchProviderElement(super.provider);

  @override
  int get groupMatchId => (origin as GroupMatchProvider).groupMatchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
