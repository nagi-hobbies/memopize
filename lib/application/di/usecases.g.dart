// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadConstValueUseCaseNotifierHash() =>
    r'199ed5e4495dff76a76c4c0b5a994ff4eb94ec43';

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

/// See also [loadConstValueUseCaseNotifier].
@ProviderFor(loadConstValueUseCaseNotifier)
const loadConstValueUseCaseNotifierProvider =
    LoadConstValueUseCaseNotifierFamily();

/// See also [loadConstValueUseCaseNotifier].
class LoadConstValueUseCaseNotifierFamily
    extends Family<LoadConstValueUseCase> {
  /// See also [loadConstValueUseCaseNotifier].
  const LoadConstValueUseCaseNotifierFamily();

  /// See also [loadConstValueUseCaseNotifier].
  LoadConstValueUseCaseNotifierProvider call(
    String constName,
  ) {
    return LoadConstValueUseCaseNotifierProvider(
      constName,
    );
  }

  @override
  LoadConstValueUseCaseNotifierProvider getProviderOverride(
    covariant LoadConstValueUseCaseNotifierProvider provider,
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
  String? get name => r'loadConstValueUseCaseNotifierProvider';
}

/// See also [loadConstValueUseCaseNotifier].
class LoadConstValueUseCaseNotifierProvider
    extends AutoDisposeProvider<LoadConstValueUseCase> {
  /// See also [loadConstValueUseCaseNotifier].
  LoadConstValueUseCaseNotifierProvider(
    String constName,
  ) : this._internal(
          (ref) => loadConstValueUseCaseNotifier(
            ref as LoadConstValueUseCaseNotifierRef,
            constName,
          ),
          from: loadConstValueUseCaseNotifierProvider,
          name: r'loadConstValueUseCaseNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadConstValueUseCaseNotifierHash,
          dependencies: LoadConstValueUseCaseNotifierFamily._dependencies,
          allTransitiveDependencies:
              LoadConstValueUseCaseNotifierFamily._allTransitiveDependencies,
          constName: constName,
        );

  LoadConstValueUseCaseNotifierProvider._internal(
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
    LoadConstValueUseCase Function(LoadConstValueUseCaseNotifierRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadConstValueUseCaseNotifierProvider._internal(
        (ref) => create(ref as LoadConstValueUseCaseNotifierRef),
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
  AutoDisposeProviderElement<LoadConstValueUseCase> createElement() {
    return _LoadConstValueUseCaseNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadConstValueUseCaseNotifierProvider &&
        other.constName == constName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadConstValueUseCaseNotifierRef
    on AutoDisposeProviderRef<LoadConstValueUseCase> {
  /// The parameter `constName` of this provider.
  String get constName;
}

class _LoadConstValueUseCaseNotifierProviderElement
    extends AutoDisposeProviderElement<LoadConstValueUseCase>
    with LoadConstValueUseCaseNotifierRef {
  _LoadConstValueUseCaseNotifierProviderElement(super.provider);

  @override
  String get constName =>
      (origin as LoadConstValueUseCaseNotifierProvider).constName;
}

String _$pressedNumUseCaseNotifierHash() =>
    r'6f80d259250617d541bca0eb0f2ce3c6007e4ab3';

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
String _$exitGamePageUseCaseNotifierHash() =>
    r'3b436cf277b87b60b544ca7390798c60aea34821';

/// See also [exitGamePageUseCaseNotifier].
@ProviderFor(exitGamePageUseCaseNotifier)
final exitGamePageUseCaseNotifierProvider =
    AutoDisposeProvider<ExitGamePageUseCase>.internal(
  exitGamePageUseCaseNotifier,
  name: r'exitGamePageUseCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exitGamePageUseCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExitGamePageUseCaseNotifierRef
    = AutoDisposeProviderRef<ExitGamePageUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
