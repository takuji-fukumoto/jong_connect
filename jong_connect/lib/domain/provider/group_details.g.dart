// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupDetailsHash() => r'0f98d1a05863e8fc195f2d8f5efaff3710616324';

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

/// See also [groupDetails].
@ProviderFor(groupDetails)
const groupDetailsProvider = GroupDetailsFamily();

/// See also [groupDetails].
class GroupDetailsFamily extends Family<AsyncValue<Group>> {
  /// See also [groupDetails].
  const GroupDetailsFamily();

  /// See also [groupDetails].
  GroupDetailsProvider call({
    required int groupId,
  }) {
    return GroupDetailsProvider(
      groupId: groupId,
    );
  }

  @override
  GroupDetailsProvider getProviderOverride(
    covariant GroupDetailsProvider provider,
  ) {
    return call(
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
  String? get name => r'groupDetailsProvider';
}

/// See also [groupDetails].
class GroupDetailsProvider extends AutoDisposeFutureProvider<Group> {
  /// See also [groupDetails].
  GroupDetailsProvider({
    required int groupId,
  }) : this._internal(
          (ref) => groupDetails(
            ref as GroupDetailsRef,
            groupId: groupId,
          ),
          from: groupDetailsProvider,
          name: r'groupDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailsHash,
          dependencies: GroupDetailsFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailsFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupDetailsProvider._internal(
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
  Override overrideWith(
    FutureOr<Group> Function(GroupDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupDetailsProvider._internal(
        (ref) => create(ref as GroupDetailsRef),
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
  AutoDisposeFutureProviderElement<Group> createElement() {
    return _GroupDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDetailsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupDetailsRef on AutoDisposeFutureProviderRef<Group> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _GroupDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Group> with GroupDetailsRef {
  _GroupDetailsProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupDetailsProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
