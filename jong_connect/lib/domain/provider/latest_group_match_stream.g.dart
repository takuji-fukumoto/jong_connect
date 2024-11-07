// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_group_match_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$latestGroupMatchStreamHash() =>
    r'45fe2b69204d1a73727c0591341a96e858aeffa0';

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

/// See also [latestGroupMatchStream].
@ProviderFor(latestGroupMatchStream)
const latestGroupMatchStreamProvider = LatestGroupMatchStreamFamily();

/// See also [latestGroupMatchStream].
class LatestGroupMatchStreamFamily extends Family<AsyncValue<GroupMatch?>> {
  /// See also [latestGroupMatchStream].
  const LatestGroupMatchStreamFamily();

  /// See also [latestGroupMatchStream].
  LatestGroupMatchStreamProvider call(
    int groupId,
  ) {
    return LatestGroupMatchStreamProvider(
      groupId,
    );
  }

  @override
  LatestGroupMatchStreamProvider getProviderOverride(
    covariant LatestGroupMatchStreamProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'latestGroupMatchStreamProvider';
}

/// See also [latestGroupMatchStream].
class LatestGroupMatchStreamProvider
    extends AutoDisposeStreamProvider<GroupMatch?> {
  /// See also [latestGroupMatchStream].
  LatestGroupMatchStreamProvider(
    int groupId,
  ) : this._internal(
          (ref) => latestGroupMatchStream(
            ref as LatestGroupMatchStreamRef,
            groupId,
          ),
          from: latestGroupMatchStreamProvider,
          name: r'latestGroupMatchStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$latestGroupMatchStreamHash,
          dependencies: LatestGroupMatchStreamFamily._dependencies,
          allTransitiveDependencies:
              LatestGroupMatchStreamFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  LatestGroupMatchStreamProvider._internal(
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
    Stream<GroupMatch?> Function(LatestGroupMatchStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LatestGroupMatchStreamProvider._internal(
        (ref) => create(ref as LatestGroupMatchStreamRef),
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
  AutoDisposeStreamProviderElement<GroupMatch?> createElement() {
    return _LatestGroupMatchStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LatestGroupMatchStreamProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LatestGroupMatchStreamRef on AutoDisposeStreamProviderRef<GroupMatch?> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _LatestGroupMatchStreamProviderElement
    extends AutoDisposeStreamProviderElement<GroupMatch?>
    with LatestGroupMatchStreamRef {
  _LatestGroupMatchStreamProviderElement(super.provider);

  @override
  int get groupId => (origin as LatestGroupMatchStreamProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
