// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_requested_friend_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isRequestedFriendUserHash() =>
    r'c63c4dc47264ef7e0e49a258ce2122246941dd57';

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

/// See also [isRequestedFriendUser].
@ProviderFor(isRequestedFriendUser)
const isRequestedFriendUserProvider = IsRequestedFriendUserFamily();

/// See also [isRequestedFriendUser].
class IsRequestedFriendUserFamily extends Family<AsyncValue<bool>> {
  /// See also [isRequestedFriendUser].
  const IsRequestedFriendUserFamily();

  /// See also [isRequestedFriendUser].
  IsRequestedFriendUserProvider call(
    int targetFriendId,
  ) {
    return IsRequestedFriendUserProvider(
      targetFriendId,
    );
  }

  @override
  IsRequestedFriendUserProvider getProviderOverride(
    covariant IsRequestedFriendUserProvider provider,
  ) {
    return call(
      provider.targetFriendId,
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
  String? get name => r'isRequestedFriendUserProvider';
}

/// See also [isRequestedFriendUser].
class IsRequestedFriendUserProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isRequestedFriendUser].
  IsRequestedFriendUserProvider(
    int targetFriendId,
  ) : this._internal(
          (ref) => isRequestedFriendUser(
            ref as IsRequestedFriendUserRef,
            targetFriendId,
          ),
          from: isRequestedFriendUserProvider,
          name: r'isRequestedFriendUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isRequestedFriendUserHash,
          dependencies: IsRequestedFriendUserFamily._dependencies,
          allTransitiveDependencies:
              IsRequestedFriendUserFamily._allTransitiveDependencies,
          targetFriendId: targetFriendId,
        );

  IsRequestedFriendUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetFriendId,
  }) : super.internal();

  final int targetFriendId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsRequestedFriendUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsRequestedFriendUserProvider._internal(
        (ref) => create(ref as IsRequestedFriendUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetFriendId: targetFriendId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsRequestedFriendUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsRequestedFriendUserProvider &&
        other.targetFriendId == targetFriendId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetFriendId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsRequestedFriendUserRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `targetFriendId` of this provider.
  int get targetFriendId;
}

class _IsRequestedFriendUserProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with IsRequestedFriendUserRef {
  _IsRequestedFriendUserProviderElement(super.provider);

  @override
  int get targetFriendId =>
      (origin as IsRequestedFriendUserProvider).targetFriendId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
