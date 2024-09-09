// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_match_players.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupMatchPlayersHash() => r'cd7b1f7dc14d39b970f8be16c093bce72e39f2d8';

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

abstract class _$GroupMatchPlayers
    extends BuildlessAutoDisposeAsyncNotifier<List<AppUser>> {
  late final int groupId;

  FutureOr<List<AppUser>> build(
    int groupId,
  );
}

/// See also [GroupMatchPlayers].
@ProviderFor(GroupMatchPlayers)
const groupMatchPlayersProvider = GroupMatchPlayersFamily();

/// See also [GroupMatchPlayers].
class GroupMatchPlayersFamily extends Family<AsyncValue<List<AppUser>>> {
  /// See also [GroupMatchPlayers].
  const GroupMatchPlayersFamily();

  /// See also [GroupMatchPlayers].
  GroupMatchPlayersProvider call(
    int groupId,
  ) {
    return GroupMatchPlayersProvider(
      groupId,
    );
  }

  @override
  GroupMatchPlayersProvider getProviderOverride(
    covariant GroupMatchPlayersProvider provider,
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
  String? get name => r'groupMatchPlayersProvider';
}

/// See also [GroupMatchPlayers].
class GroupMatchPlayersProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GroupMatchPlayers, List<AppUser>> {
  /// See also [GroupMatchPlayers].
  GroupMatchPlayersProvider(
    int groupId,
  ) : this._internal(
          () => GroupMatchPlayers()..groupId = groupId,
          from: groupMatchPlayersProvider,
          name: r'groupMatchPlayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupMatchPlayersHash,
          dependencies: GroupMatchPlayersFamily._dependencies,
          allTransitiveDependencies:
              GroupMatchPlayersFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupMatchPlayersProvider._internal(
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
  FutureOr<List<AppUser>> runNotifierBuild(
    covariant GroupMatchPlayers notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(GroupMatchPlayers Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupMatchPlayersProvider._internal(
        () => create()..groupId = groupId,
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
  AutoDisposeAsyncNotifierProviderElement<GroupMatchPlayers, List<AppUser>>
      createElement() {
    return _GroupMatchPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupMatchPlayersProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupMatchPlayersRef
    on AutoDisposeAsyncNotifierProviderRef<List<AppUser>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _GroupMatchPlayersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GroupMatchPlayers,
        List<AppUser>> with GroupMatchPlayersRef {
  _GroupMatchPlayersProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupMatchPlayersProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
