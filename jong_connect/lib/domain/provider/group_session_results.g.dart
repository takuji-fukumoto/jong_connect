// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_session_results.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupSessionResultsHash() =>
    r'e2cd46a51dd12032ed90543117a19e103b8727e8';

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

/// See also [groupSessionResults].
@ProviderFor(groupSessionResults)
const groupSessionResultsProvider = GroupSessionResultsFamily();

/// See also [groupSessionResults].
class GroupSessionResultsFamily extends Family<AsyncValue<List<Group>>> {
  /// See also [groupSessionResults].
  const GroupSessionResultsFamily();

  /// See also [groupSessionResults].
  GroupSessionResultsProvider call({
    required int groupId,
    required int pageNum,
    int itemsPerPage = 30,
  }) {
    return GroupSessionResultsProvider(
      groupId: groupId,
      pageNum: pageNum,
      itemsPerPage: itemsPerPage,
    );
  }

  @override
  GroupSessionResultsProvider getProviderOverride(
    covariant GroupSessionResultsProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
      pageNum: provider.pageNum,
      itemsPerPage: provider.itemsPerPage,
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
  String? get name => r'groupSessionResultsProvider';
}

/// See also [groupSessionResults].
class GroupSessionResultsProvider
    extends AutoDisposeFutureProvider<List<Group>> {
  /// See also [groupSessionResults].
  GroupSessionResultsProvider({
    required int groupId,
    required int pageNum,
    int itemsPerPage = 30,
  }) : this._internal(
          (ref) => groupSessionResults(
            ref as GroupSessionResultsRef,
            groupId: groupId,
            pageNum: pageNum,
            itemsPerPage: itemsPerPage,
          ),
          from: groupSessionResultsProvider,
          name: r'groupSessionResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupSessionResultsHash,
          dependencies: GroupSessionResultsFamily._dependencies,
          allTransitiveDependencies:
              GroupSessionResultsFamily._allTransitiveDependencies,
          groupId: groupId,
          pageNum: pageNum,
          itemsPerPage: itemsPerPage,
        );

  GroupSessionResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.pageNum,
    required this.itemsPerPage,
  }) : super.internal();

  final int groupId;
  final int pageNum;
  final int itemsPerPage;

  @override
  Override overrideWith(
    FutureOr<List<Group>> Function(GroupSessionResultsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupSessionResultsProvider._internal(
        (ref) => create(ref as GroupSessionResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        pageNum: pageNum,
        itemsPerPage: itemsPerPage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Group>> createElement() {
    return _GroupSessionResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupSessionResultsProvider &&
        other.groupId == groupId &&
        other.pageNum == pageNum &&
        other.itemsPerPage == itemsPerPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, pageNum.hashCode);
    hash = _SystemHash.combine(hash, itemsPerPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupSessionResultsRef on AutoDisposeFutureProviderRef<List<Group>> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `pageNum` of this provider.
  int get pageNum;

  /// The parameter `itemsPerPage` of this provider.
  int get itemsPerPage;
}

class _GroupSessionResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<Group>>
    with GroupSessionResultsRef {
  _GroupSessionResultsProviderElement(super.provider);

  @override
  int get groupId => (origin as GroupSessionResultsProvider).groupId;
  @override
  int get pageNum => (origin as GroupSessionResultsProvider).pageNum;
  @override
  int get itemsPerPage => (origin as GroupSessionResultsProvider).itemsPerPage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
