// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameRecordHash() => r'8e3742f66a661f97d041782c6652767bd5b66b77';

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

/// See also [gameRecord].
@ProviderFor(gameRecord)
const gameRecordProvider = GameRecordFamily();

/// See also [gameRecord].
class GameRecordFamily extends Family<AsyncValue<GameRecord>> {
  /// See also [gameRecord].
  const GameRecordFamily();

  /// See also [gameRecord].
  GameRecordProvider call({
    required String userId,
    required String matchTypeName,
    int? groupId,
  }) {
    return GameRecordProvider(
      userId: userId,
      matchTypeName: matchTypeName,
      groupId: groupId,
    );
  }

  @override
  GameRecordProvider getProviderOverride(
    covariant GameRecordProvider provider,
  ) {
    return call(
      userId: provider.userId,
      matchTypeName: provider.matchTypeName,
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
  String? get name => r'gameRecordProvider';
}

/// See also [gameRecord].
class GameRecordProvider extends AutoDisposeFutureProvider<GameRecord> {
  /// See also [gameRecord].
  GameRecordProvider({
    required String userId,
    required String matchTypeName,
    int? groupId,
  }) : this._internal(
          (ref) => gameRecord(
            ref as GameRecordRef,
            userId: userId,
            matchTypeName: matchTypeName,
            groupId: groupId,
          ),
          from: gameRecordProvider,
          name: r'gameRecordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameRecordHash,
          dependencies: GameRecordFamily._dependencies,
          allTransitiveDependencies:
              GameRecordFamily._allTransitiveDependencies,
          userId: userId,
          matchTypeName: matchTypeName,
          groupId: groupId,
        );

  GameRecordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.matchTypeName,
    required this.groupId,
  }) : super.internal();

  final String userId;
  final String matchTypeName;
  final int? groupId;

  @override
  Override overrideWith(
    FutureOr<GameRecord> Function(GameRecordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameRecordProvider._internal(
        (ref) => create(ref as GameRecordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        matchTypeName: matchTypeName,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GameRecord> createElement() {
    return _GameRecordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameRecordProvider &&
        other.userId == userId &&
        other.matchTypeName == matchTypeName &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, matchTypeName.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameRecordRef on AutoDisposeFutureProviderRef<GameRecord> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `matchTypeName` of this provider.
  String get matchTypeName;

  /// The parameter `groupId` of this provider.
  int? get groupId;
}

class _GameRecordProviderElement
    extends AutoDisposeFutureProviderElement<GameRecord> with GameRecordRef {
  _GameRecordProviderElement(super.provider);

  @override
  String get userId => (origin as GameRecordProvider).userId;
  @override
  String get matchTypeName => (origin as GameRecordProvider).matchTypeName;
  @override
  int? get groupId => (origin as GameRecordProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
