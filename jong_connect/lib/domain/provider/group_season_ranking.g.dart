// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_season_ranking.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupSeasonRankingHash() =>
    r'3f5b247f9af620f93a77c1f22497462e4513e591';

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
  }) {
    return GroupSeasonRankingProvider(
      groupId: groupId,
      seasonId: seasonId,
    );
  }

  @override
  GroupSeasonRankingProvider getProviderOverride(
    covariant GroupSeasonRankingProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      seasonId: provider.seasonId,
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
  }) : this._internal(
          (ref) => groupSeasonRanking(
            ref as GroupSeasonRankingRef,
            groupId: groupId,
            seasonId: seasonId,
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
  }) : super.internal();

  final int groupId;
  final int seasonId;

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
        other.seasonId == seasonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, seasonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupSeasonRankingRef on AutoDisposeFutureProviderRef<GroupRanking> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `seasonId` of this provider.
  int get seasonId;
}

class _GroupSeasonRankingProviderElement
    extends AutoDisposeFutureProviderElement<GroupRanking>
    with GroupSeasonRankingRef {
  _GroupSeasonRankingProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupSeasonRankingProvider).groupId;
  @override
  int get seasonId => (origin as GroupSeasonRankingProvider).seasonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
