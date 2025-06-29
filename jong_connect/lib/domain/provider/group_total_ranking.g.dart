// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_total_ranking.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupTotalRankingHash() => r'4b7b57579b349a5e4c5103af706899d31bba2522';

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

/// See also [groupTotalRanking].
@ProviderFor(groupTotalRanking)
const groupTotalRankingProvider = GroupTotalRankingFamily();

/// See also [groupTotalRanking].
class GroupTotalRankingFamily extends Family<AsyncValue<GroupRanking>> {
  /// See also [groupTotalRanking].
  const GroupTotalRankingFamily();

  /// See also [groupTotalRanking].
  GroupTotalRankingProvider call({
    required int groupId,
    required MatchType matchType,
  }) {
    return GroupTotalRankingProvider(
      groupId: groupId,
      matchType: matchType,
    );
  }

  @override
  GroupTotalRankingProvider getProviderOverride(
    covariant GroupTotalRankingProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      matchType: provider.matchType,
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
  String? get name => r'groupTotalRankingProvider';
}

/// See also [groupTotalRanking].
class GroupTotalRankingProvider
    extends AutoDisposeFutureProvider<GroupRanking> {
  /// See also [groupTotalRanking].
  GroupTotalRankingProvider({
    required int groupId,
    required MatchType matchType,
  }) : this._internal(
          (ref) => groupTotalRanking(
            ref as GroupTotalRankingRef,
            groupId: groupId,
            matchType: matchType,
          ),
          from: groupTotalRankingProvider,
          name: r'groupTotalRankingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupTotalRankingHash,
          dependencies: GroupTotalRankingFamily._dependencies,
          allTransitiveDependencies:
              GroupTotalRankingFamily._allTransitiveDependencies,
          groupId: groupId,
          matchType: matchType,
        );

  GroupTotalRankingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.matchType,
  }) : super.internal();

  final int groupId;
  final MatchType matchType;

  @override
  Override overrideWith(
    FutureOr<GroupRanking> Function(GroupTotalRankingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupTotalRankingProvider._internal(
        (ref) => create(ref as GroupTotalRankingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        matchType: matchType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupRanking> createElement() {
    return _GroupTotalRankingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupTotalRankingProvider &&
        other.groupId == groupId &&
        other.matchType == matchType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, matchType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupTotalRankingRef on AutoDisposeFutureProviderRef<GroupRanking> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `matchType` of this provider.
  MatchType get matchType;
}

class _GroupTotalRankingProviderElement
    extends AutoDisposeFutureProviderElement<GroupRanking>
    with GroupTotalRankingRef {
  _GroupTotalRankingProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupTotalRankingProvider).groupId;
  @override
  MatchType get matchType => (origin as GroupTotalRankingProvider).matchType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
