// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match_results_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchResultsStreamHash() =>
    r'ce75b82ff05292f477a34f8e84231c9f74cb6357';

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

/// See also [groupMatchResultsStream].
@ProviderFor(groupMatchResultsStream)
const groupMatchResultsStreamProvider = GroupMatchResultsStreamFamily();

/// See also [groupMatchResultsStream].
class GroupMatchResultsStreamFamily
    extends Family<AsyncValue<List<GroupMatchResult>>> {
  /// See also [groupMatchResultsStream].
  const GroupMatchResultsStreamFamily();

  /// See also [groupMatchResultsStream].
  GroupMatchResultsStreamProvider call(
    int groupMatchId,
  ) {
    return GroupMatchResultsStreamProvider(
      groupMatchId,
    );
  }

  @override
  GroupMatchResultsStreamProvider getProviderOverride(
    covariant GroupMatchResultsStreamProvider provider,
  ) {
    return call(
      provider.groupMatchId,
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
  String? get name => r'groupMatchResultsStreamProvider';
}

/// See also [groupMatchResultsStream].
class GroupMatchResultsStreamProvider
    extends AutoDisposeStreamProvider<List<GroupMatchResult>> {
  /// See also [groupMatchResultsStream].
  GroupMatchResultsStreamProvider(
    int groupMatchId,
  ) : this._internal(
          (ref) => groupMatchResultsStream(
            ref as GroupMatchResultsStreamRef,
            groupMatchId,
          ),
          from: groupMatchResultsStreamProvider,
          name: r'groupMatchResultsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchResultsStreamHash,
          dependencies: GroupMatchResultsStreamFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchResultsStreamFamily._allTransitiveDependencies,
          groupMatchId: groupMatchId,
        );

  GroupMatchResultsStreamProvider._internal(
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
    Stream<List<GroupMatchResult>> Function(GroupMatchResultsStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchResultsStreamProvider._internal(
        (ref) => create(ref as GroupMatchResultsStreamRef),
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
  AutoDisposeStreamProviderElement<List<GroupMatchResult>> createElement() {
    return _GroupMatchResultsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchResultsStreamProvider &&
        other.groupMatchId == groupMatchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupMatchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchResultsStreamRef
    on AutoDisposeStreamProviderRef<List<GroupMatchResult>> {
  /// The parameter `groupMatchId` of this provider.
  int get groupMatchId;
}

class _GroupMatchResultsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<GroupMatchResult>>
    with GroupMatchResultsStreamRef {
  _GroupMatchResultsStreamProviderElement(super.provider);

  @override
  int get groupMatchId =>
      (origin as GroupMatchResultsStreamProvider).groupMatchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
