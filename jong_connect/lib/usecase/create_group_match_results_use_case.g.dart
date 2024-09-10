// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_match_results_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createGroupMatchResultsUseCaseHash() =>
    r'95b55ee814e849deebb73cc34574cb6814e30e0b';

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

abstract class _$CreateGroupMatchResultsUseCase
    extends BuildlessAutoDisposeNotifier<MatchResultRecords> {
  late final int groupId;
  late final String matchTypeName;

  MatchResultRecords build(
    int groupId,
    String matchTypeName,
  );
}

/// See also [CreateGroupMatchResultsUseCase].
@ProviderFor(CreateGroupMatchResultsUseCase)
const createGroupMatchResultsUseCaseProvider =
    CreateGroupMatchResultsUseCaseFamily();

/// See also [CreateGroupMatchResultsUseCase].
class CreateGroupMatchResultsUseCaseFamily extends Family<MatchResultRecords> {
  /// See also [CreateGroupMatchResultsUseCase].
  const CreateGroupMatchResultsUseCaseFamily();

  /// See also [CreateGroupMatchResultsUseCase].
  CreateGroupMatchResultsUseCaseProvider call(
    int groupId,
    String matchTypeName,
  ) {
    return CreateGroupMatchResultsUseCaseProvider(
      groupId,
      matchTypeName,
    );
  }

  @override
  CreateGroupMatchResultsUseCaseProvider getProviderOverride(
    covariant CreateGroupMatchResultsUseCaseProvider provider,
  ) {
    return call(
      provider.groupId,
      provider.matchTypeName,
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
  String? get name => r'createGroupMatchResultsUseCaseProvider';
}

/// See also [CreateGroupMatchResultsUseCase].
class CreateGroupMatchResultsUseCaseProvider
    extends AutoDisposeNotifierProviderImpl<CreateGroupMatchResultsUseCase,
        MatchResultRecords> {
  /// See also [CreateGroupMatchResultsUseCase].
  CreateGroupMatchResultsUseCaseProvider(
    int groupId,
    String matchTypeName,
  ) : this._internal(
          () => CreateGroupMatchResultsUseCase()
            ..groupId = groupId
            ..matchTypeName = matchTypeName,
          from: createGroupMatchResultsUseCaseProvider,
          name: r'createGroupMatchResultsUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createGroupMatchResultsUseCaseHash,
          dependencies: CreateGroupMatchResultsUseCaseFamily._dependencies,
          allTransitiveDependencies:
              CreateGroupMatchResultsUseCaseFamily._allTransitiveDependencies,
          groupId: groupId,
          matchTypeName: matchTypeName,
        );

  CreateGroupMatchResultsUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.matchTypeName,
  }) : super.internal();

  final int groupId;
  final String matchTypeName;

  @override
  MatchResultRecords runNotifierBuild(
    covariant CreateGroupMatchResultsUseCase notifier,
  ) {
    return notifier.build(
      groupId,
      matchTypeName,
    );
  }

  @override
  Override overrideWith(CreateGroupMatchResultsUseCase Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateGroupMatchResultsUseCaseProvider._internal(
        () => create()
          ..groupId = groupId
          ..matchTypeName = matchTypeName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        matchTypeName: matchTypeName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CreateGroupMatchResultsUseCase,
      MatchResultRecords> createElement() {
    return _CreateGroupMatchResultsUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateGroupMatchResultsUseCaseProvider &&
        other.groupId == groupId &&
        other.matchTypeName == matchTypeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, matchTypeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateGroupMatchResultsUseCaseRef
    on AutoDisposeNotifierProviderRef<MatchResultRecords> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `matchTypeName` of this provider.
  String get matchTypeName;
}

class _CreateGroupMatchResultsUseCaseProviderElement
    extends AutoDisposeNotifierProviderElement<CreateGroupMatchResultsUseCase,
        MatchResultRecords> with CreateGroupMatchResultsUseCaseRef {
  _CreateGroupMatchResultsUseCaseProviderElement(super.provider);

  @override
  int get groupId => (origin as CreateGroupMatchResultsUseCaseProvider).groupId;
  @override
  String get matchTypeName =>
      (origin as CreateGroupMatchResultsUseCaseProvider).matchTypeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
