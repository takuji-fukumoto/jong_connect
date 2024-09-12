// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match_round_results.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchRoundResultsHash() =>
    r'3352278b62ae5dcad0d6e0060919951365e17619';

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

/// See also [groupMatchRoundResults].
@ProviderFor(groupMatchRoundResults)
const groupMatchRoundResultsProvider = GroupMatchRoundResultsFamily();

/// See also [groupMatchRoundResults].
class GroupMatchRoundResultsFamily
    extends Family<AsyncValue<List<GroupMatchResult>>> {
  /// See also [groupMatchRoundResults].
  const GroupMatchRoundResultsFamily();

  /// See also [groupMatchRoundResults].
  GroupMatchRoundResultsProvider call({
    required int groupMatchId,
    required int matchOrder,
  }) {
    return GroupMatchRoundResultsProvider(
      groupMatchId: groupMatchId,
      matchOrder: matchOrder,
    );
  }

  @override
  GroupMatchRoundResultsProvider getProviderOverride(
    covariant GroupMatchRoundResultsProvider provider,
  ) {
    return call(
      groupMatchId: provider.groupMatchId,
      matchOrder: provider.matchOrder,
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
  String? get name => r'groupMatchRoundResultsProvider';
}

/// See also [groupMatchRoundResults].
class GroupMatchRoundResultsProvider
    extends AutoDisposeFutureProvider<List<GroupMatchResult>> {
  /// See also [groupMatchRoundResults].
  GroupMatchRoundResultsProvider({
    required int groupMatchId,
    required int matchOrder,
  }) : this._internal(
          (ref) => groupMatchRoundResults(
            ref as GroupMatchRoundResultsRef,
            groupMatchId: groupMatchId,
            matchOrder: matchOrder,
          ),
          from: groupMatchRoundResultsProvider,
          name: r'groupMatchRoundResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchRoundResultsHash,
          dependencies: GroupMatchRoundResultsFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchRoundResultsFamily._allTransitiveDependencies,
          groupMatchId: groupMatchId,
          matchOrder: matchOrder,
        );

  GroupMatchRoundResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupMatchId,
    required this.matchOrder,
  }) : super.internal();

  final int groupMatchId;
  final int matchOrder;

  @override
  Override overrideWith(
    FutureOr<List<GroupMatchResult>> Function(
            GroupMatchRoundResultsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchRoundResultsProvider._internal(
        (ref) => create(ref as GroupMatchRoundResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupMatchId: groupMatchId,
        matchOrder: matchOrder,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GroupMatchResult>> createElement() {
    return _GroupMatchRoundResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchRoundResultsProvider &&
        other.groupMatchId == groupMatchId &&
        other.matchOrder == matchOrder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupMatchId.hashCode);
    hash = _SystemHash.combine(hash, matchOrder.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchRoundResultsRef
    on AutoDisposeFutureProviderRef<List<GroupMatchResult>> {
  /// The parameter `groupMatchId` of this provider.
  int get groupMatchId;

  /// The parameter `matchOrder` of this provider.
  int get matchOrder;
}

class _GroupMatchRoundResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<GroupMatchResult>>
    with GroupMatchRoundResultsRef {
  _GroupMatchRoundResultsProviderElement(super.provider);

  @override
  int get groupMatchId =>
      (origin as GroupMatchRoundResultsProvider).groupMatchId;
  @override
  int get matchOrder => (origin as GroupMatchRoundResultsProvider).matchOrder;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
