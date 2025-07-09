// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_match_results.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentlyMatchResultsHash() =>
    r'3ee296cfad224b30ff3b14044a35e56844c4048e';

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

/// See also [recentlyMatchResults].
@ProviderFor(recentlyMatchResults)
const recentlyMatchResultsProvider = RecentlyMatchResultsFamily();

/// See also [recentlyMatchResults].
class RecentlyMatchResultsFamily extends Family<AsyncValue<List<GroupMatch>>> {
  /// See also [recentlyMatchResults].
  const RecentlyMatchResultsFamily();

  /// See also [recentlyMatchResults].
  RecentlyMatchResultsProvider call({
    int limit = 3,
  }) {
    return RecentlyMatchResultsProvider(
      limit: limit,
    );
  }

  @override
  RecentlyMatchResultsProvider getProviderOverride(
    covariant RecentlyMatchResultsProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'recentlyMatchResultsProvider';
}

/// See also [recentlyMatchResults].
class RecentlyMatchResultsProvider
    extends AutoDisposeFutureProvider<List<GroupMatch>> {
  /// See also [recentlyMatchResults].
  RecentlyMatchResultsProvider({
    int limit = 3,
  }) : this._internal(
          (ref) => recentlyMatchResults(
            ref as RecentlyMatchResultsRef,
            limit: limit,
          ),
          from: recentlyMatchResultsProvider,
          name: r'recentlyMatchResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recentlyMatchResultsHash,
          dependencies: RecentlyMatchResultsFamily._dependencies,
          allTransitiveDependencies:
              RecentlyMatchResultsFamily._allTransitiveDependencies,
          limit: limit,
        );

  RecentlyMatchResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<GroupMatch>> Function(RecentlyMatchResultsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentlyMatchResultsProvider._internal(
        (ref) => create(ref as RecentlyMatchResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GroupMatch>> createElement() {
    return _RecentlyMatchResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentlyMatchResultsProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecentlyMatchResultsRef
    on AutoDisposeFutureProviderRef<List<GroupMatch>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _RecentlyMatchResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<GroupMatch>>
    with RecentlyMatchResultsRef {
  _RecentlyMatchResultsProviderElement(super.provider);

  @override
  int get limit => (origin as RecentlyMatchResultsProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
