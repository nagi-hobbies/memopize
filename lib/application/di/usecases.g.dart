// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadConstDataUseCaseNotifierHash() =>
    r'49a4978e030de516fef6e7a1baaac51fb25136c4';

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

/// See also [loadConstDataUseCaseNotifier].
@ProviderFor(loadConstDataUseCaseNotifier)
const loadConstDataUseCaseNotifierProvider =
    LoadConstDataUseCaseNotifierFamily();

/// See also [loadConstDataUseCaseNotifier].
class LoadConstDataUseCaseNotifierFamily extends Family<LoadConstDataUseCase> {
  /// See also [loadConstDataUseCaseNotifier].
  const LoadConstDataUseCaseNotifierFamily();

  /// See also [loadConstDataUseCaseNotifier].
  LoadConstDataUseCaseNotifierProvider call(
    String constName,
  ) {
    return LoadConstDataUseCaseNotifierProvider(
      constName,
    );
  }

  @override
  LoadConstDataUseCaseNotifierProvider getProviderOverride(
    covariant LoadConstDataUseCaseNotifierProvider provider,
  ) {
    return call(
      provider.constName,
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
  String? get name => r'loadConstDataUseCaseNotifierProvider';
}

/// See also [loadConstDataUseCaseNotifier].
class LoadConstDataUseCaseNotifierProvider
    extends AutoDisposeProvider<LoadConstDataUseCase> {
  /// See also [loadConstDataUseCaseNotifier].
  LoadConstDataUseCaseNotifierProvider(
    String constName,
  ) : this._internal(
          (ref) => loadConstDataUseCaseNotifier(
            ref as LoadConstDataUseCaseNotifierRef,
            constName,
          ),
          from: loadConstDataUseCaseNotifierProvider,
          name: r'loadConstDataUseCaseNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadConstDataUseCaseNotifierHash,
          dependencies: LoadConstDataUseCaseNotifierFamily._dependencies,
          allTransitiveDependencies:
              LoadConstDataUseCaseNotifierFamily._allTransitiveDependencies,
          constName: constName,
        );

  LoadConstDataUseCaseNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.constName,
  }) : super.internal();

  final String constName;

  @override
  Override overrideWith(
    LoadConstDataUseCase Function(LoadConstDataUseCaseNotifierRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadConstDataUseCaseNotifierProvider._internal(
        (ref) => create(ref as LoadConstDataUseCaseNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        constName: constName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<LoadConstDataUseCase> createElement() {
    return _LoadConstDataUseCaseNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadConstDataUseCaseNotifierProvider &&
        other.constName == constName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadConstDataUseCaseNotifierRef
    on AutoDisposeProviderRef<LoadConstDataUseCase> {
  /// The parameter `constName` of this provider.
  String get constName;
}

class _LoadConstDataUseCaseNotifierProviderElement
    extends AutoDisposeProviderElement<LoadConstDataUseCase>
    with LoadConstDataUseCaseNotifierRef {
  _LoadConstDataUseCaseNotifierProviderElement(super.provider);

  @override
  String get constName =>
      (origin as LoadConstDataUseCaseNotifierProvider).constName;
}

String _$pressedNumUseCaseNotifierHash() =>
    r'394b6be4a7b8766df57068c1803053a0aa409815';

/// See also [pressedNumUseCaseNotifier].
@ProviderFor(pressedNumUseCaseNotifier)
final pressedNumUseCaseNotifierProvider =
    AutoDisposeProvider<PressedNumUseCase>.internal(
  pressedNumUseCaseNotifier,
  name: r'pressedNumUseCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pressedNumUseCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PressedNumUseCaseNotifierRef
    = AutoDisposeProviderRef<PressedNumUseCase>;
String _$pressedContinueUseCaseNotifierHash() =>
    r'0c4c6dbc318352e1c52305ee9347bd21c56d41ee';

/// See also [pressedContinueUseCaseNotifier].
@ProviderFor(pressedContinueUseCaseNotifier)
final pressedContinueUseCaseNotifierProvider =
    AutoDisposeProvider<PressedContinueUseCase>.internal(
  pressedContinueUseCaseNotifier,
  name: r'pressedContinueUseCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pressedContinueUseCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PressedContinueUseCaseNotifierRef
    = AutoDisposeProviderRef<PressedContinueUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
