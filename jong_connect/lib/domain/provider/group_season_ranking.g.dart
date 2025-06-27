// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_season_ranking.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupSeasonRankingHash() =>
    r'7c3aeedd0fd45268f2753d3fb71c75cde43e5558';

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

/// See also [groupSeasonRanking].
@ProviderFor(groupSeasonRanking)
const groupSeasonRankingProvider = GroupSeasonRankingFamily();

/// See also [groupSeasonRanking].
class GroupSeasonRankingFamily extends Family<AsyncValue<GroupRanking>> {
  /// See also [groupSeasonRanking].
  const GroupSeasonRankingFamily();

  /// See also [groupSeasonRanking].
  GroupSeasonRankingProvider call({
    required int groupId,
    required int seasonId,
    required MatchType matchType,
  }) {
    return GroupSeasonRankingProvider(
      groupId: groupId,
      seasonId: seasonId,
      matchType: matchType,
    );
  }

  @override
  GroupSeasonRankingProvider getProviderOverride(
    covariant GroupSeasonRankingProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      seasonId: provider.seasonId,
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
  String? get name => r'groupSeasonRankingProvider';
}

/// See also [groupSeasonRanking].
class GroupSeasonRankingProvider
    extends AutoDisposeFutureProvider<GroupRanking> {
  /// See also [groupSeasonRanking].
  GroupSeasonRankingProvider({
    required int groupId,
    required int seasonId,
    required MatchType matchType,
  }) : this._internal(
          (ref) => groupSeasonRanking(
            ref as GroupSeasonRankingRef,
            groupId: groupId,
            seasonId: seasonId,
            matchType: matchType,
          ),
          from: groupSeasonRankingProvider,
          name: r'groupSeasonRankingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupSeasonRankingHash,
          dependencies: GroupSeasonRankingFamily._dependencies,
          allTransitiveDependencies:
              GroupSeasonRankingFamily._allTransitiveDependencies,
          groupId: groupId,
          seasonId: seasonId,
          matchType: matchType,
        );

  GroupSeasonRankingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.seasonId,
    required this.matchType,
  }) : super.internal();

  final int groupId;
  final int seasonId;
  final MatchType matchType;

  @override
  Override overrideWith(
    FutureOr<GroupRanking> Function(GroupSeasonRankingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupSeasonRankingProvider._internal(
        (ref) => create(ref as GroupSeasonRankingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        seasonId: seasonId,
        matchType: matchType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupRanking> createElement() {
    return _GroupSeasonRankingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupSeasonRankingProvider &&
        other.groupId == groupId &&
        other.seasonId == seasonId &&
        other.matchType == matchType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, seasonId.hashCode);
    hash = _SystemHash.combine(hash, matchType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupSeasonRankingRef on AutoDisposeFutureProviderRef<GroupRanking> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `seasonId` of this provider.
  int get seasonId;

  /// The parameter `matchType` of this provider.
  MatchType get matchType;
}

class _GroupSeasonRankingProviderElement
    extends AutoDisposeFutureProviderElement<GroupRanking>
    with GroupSeasonRankingRef {
  _GroupSeasonRankingProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupSeasonRankingProvider).groupId;
  @override
  int get seasonId => (origin as GroupSeasonRankingProvider).seasonId;
  @override
  MatchType get matchType => (origin as GroupSeasonRankingProvider).matchType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
