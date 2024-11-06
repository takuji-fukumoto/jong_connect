// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match_players.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchPlayersHash() => r'36c1b3a9df938d3d4d5f99a3cbc68c565c0997ea';

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

/// グループマッチに参加しているユーザー
/// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
///
/// Copied from [groupMatchPlayers].
@ProviderFor(groupMatchPlayers)
const groupMatchPlayersProvider = GroupMatchPlayersFamily();

/// グループマッチに参加しているユーザー
/// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
///
/// Copied from [groupMatchPlayers].
class GroupMatchPlayersFamily extends Family<AsyncValue<List<AppUser>>> {
  /// グループマッチに参加しているユーザー
  /// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
  ///
  /// Copied from [groupMatchPlayers].
  const GroupMatchPlayersFamily();

  /// グループマッチに参加しているユーザー
  /// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
  ///
  /// Copied from [groupMatchPlayers].
  GroupMatchPlayersProvider call(
    int groupMatchId,
  ) {
    return GroupMatchPlayersProvider(
      groupMatchId,
    );
  }

  @override
  GroupMatchPlayersProvider getProviderOverride(
    covariant GroupMatchPlayersProvider provider,
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
  String? get name => r'groupMatchPlayersProvider';
}

/// グループマッチに参加しているユーザー
/// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
///
/// Copied from [groupMatchPlayers].
class GroupMatchPlayersProvider
    extends AutoDisposeFutureProvider<List<AppUser>> {
  /// グループマッチに参加しているユーザー
  /// group_membersとの違いはグループマッチの参加者に選ばれているかどうか（group_membersはグループ内の全てのユーザー）
  ///
  /// Copied from [groupMatchPlayers].
  GroupMatchPlayersProvider(
    int groupMatchId,
  ) : this._internal(
          (ref) => groupMatchPlayers(
            ref as GroupMatchPlayersRef,
            groupMatchId,
          ),
          from: groupMatchPlayersProvider,
          name: r'groupMatchPlayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchPlayersHash,
          dependencies: GroupMatchPlayersFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchPlayersFamily._allTransitiveDependencies,
          groupMatchId: groupMatchId,
        );

  GroupMatchPlayersProvider._internal(
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
    FutureOr<List<AppUser>> Function(GroupMatchPlayersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchPlayersProvider._internal(
        (ref) => create(ref as GroupMatchPlayersRef),
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
  AutoDisposeFutureProviderElement<List<AppUser>> createElement() {
    return _GroupMatchPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchPlayersProvider &&
        other.groupMatchId == groupMatchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupMatchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchPlayersRef on AutoDisposeFutureProviderRef<List<AppUser>> {
  /// The parameter `groupMatchId` of this provider.
  int get groupMatchId;
}

class _GroupMatchPlayersProviderElement
    extends AutoDisposeFutureProviderElement<List<AppUser>>
    with GroupMatchPlayersRef {
  _GroupMatchPlayersProviderElement(super.provider);

  @override
  int get groupMatchId => (origin as GroupMatchPlayersProvider).groupMatchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
