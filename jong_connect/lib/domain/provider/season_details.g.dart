// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seasonDetailsHash() => r'497c1ed2d9762e292469cef6341c4f7ac6826013';

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

/// See also [seasonDetails].
@ProviderFor(seasonDetails)
const seasonDetailsProvider = SeasonDetailsFamily();

/// See also [seasonDetails].
class SeasonDetailsFamily extends Family<AsyncValue<Season?>> {
  /// See also [seasonDetails].
  const SeasonDetailsFamily();

  /// See also [seasonDetails].
  SeasonDetailsProvider call({
    required int seasonId,
  }) {
    return SeasonDetailsProvider(
      seasonId: seasonId,
    );
  }

  @override
  SeasonDetailsProvider getProviderOverride(
    covariant SeasonDetailsProvider provider,
  ) {
    return call(
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
  String? get name => r'seasonDetailsProvider';
}

/// See also [seasonDetails].
class SeasonDetailsProvider extends AutoDisposeFutureProvider<Season?> {
  /// See also [seasonDetails].
  SeasonDetailsProvider({
    required int seasonId,
  }) : this._internal(
          (ref) => seasonDetails(
            ref as SeasonDetailsRef,
            seasonId: seasonId,
          ),
          from: seasonDetailsProvider,
          name: r'seasonDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seasonDetailsHash,
          dependencies: SeasonDetailsFamily._dependencies,
          allTransitiveDependencies:
              SeasonDetailsFamily._allTransitiveDependencies,
          seasonId: seasonId,
        );

  SeasonDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seasonId,
  }) : super.internal();

  final int seasonId;

  @override
  Override overrideWith(
    FutureOr<Season?> Function(SeasonDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeasonDetailsProvider._internal(
        (ref) => create(ref as SeasonDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seasonId: seasonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Season?> createElement() {
    return _SeasonDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeasonDetailsProvider && other.seasonId == seasonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seasonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeasonDetailsRef on AutoDisposeFutureProviderRef<Season?> {
  /// The parameter `seasonId` of this provider.
  int get seasonId;
}

class _SeasonDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Season?> with SeasonDetailsRef {
  _SeasonDetailsProviderElement(super.provider);

  @override
  int get seasonId => (origin as SeasonDetailsProvider).seasonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
