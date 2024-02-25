// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startGameSessionUseCaseHash() =>
    r'57d42e15403039d42310ffce7fea7299d07822b2';

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

/// See also [startGameSessionUseCase].
@ProviderFor(startGameSessionUseCase)
const startGameSessionUseCaseProvider = StartGameSessionUseCaseFamily();

/// See also [startGameSessionUseCase].
class StartGameSessionUseCaseFamily extends Family<StartGameSessionUseCase> {
  /// See also [startGameSessionUseCase].
  const StartGameSessionUseCaseFamily();

  /// See also [startGameSessionUseCase].
  StartGameSessionUseCaseProvider call(
    int constId,
  ) {
    return StartGameSessionUseCaseProvider(
      constId,
    );
  }

  @override
  StartGameSessionUseCaseProvider getProviderOverride(
    covariant StartGameSessionUseCaseProvider provider,
  ) {
    return call(
      provider.constId,
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
  String? get name => r'startGameSessionUseCaseProvider';
}

/// See also [startGameSessionUseCase].
class StartGameSessionUseCaseProvider
    extends AutoDisposeProvider<StartGameSessionUseCase> {
  /// See also [startGameSessionUseCase].
  StartGameSessionUseCaseProvider(
    int constId,
  ) : this._internal(
          (ref) => startGameSessionUseCase(
            ref as StartGameSessionUseCaseRef,
            constId,
          ),
          from: startGameSessionUseCaseProvider,
          name: r'startGameSessionUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startGameSessionUseCaseHash,
          dependencies: StartGameSessionUseCaseFamily._dependencies,
          allTransitiveDependencies:
              StartGameSessionUseCaseFamily._allTransitiveDependencies,
          constId: constId,
        );

  StartGameSessionUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.constId,
  }) : super.internal();

  final int constId;

  @override
  Override overrideWith(
    StartGameSessionUseCase Function(StartGameSessionUseCaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartGameSessionUseCaseProvider._internal(
        (ref) => create(ref as StartGameSessionUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        constId: constId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<StartGameSessionUseCase> createElement() {
    return _StartGameSessionUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartGameSessionUseCaseProvider && other.constId == constId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StartGameSessionUseCaseRef
    on AutoDisposeProviderRef<StartGameSessionUseCase> {
  /// The parameter `constId` of this provider.
  int get constId;
}

class _StartGameSessionUseCaseProviderElement
    extends AutoDisposeProviderElement<StartGameSessionUseCase>
    with StartGameSessionUseCaseRef {
  _StartGameSessionUseCaseProviderElement(super.provider);

  @override
  int get constId => (origin as StartGameSessionUseCaseProvider).constId;
}

String _$pressedNumUseCaseHash() => r'0a0e66d4514a03a5558d538b15946902b447be02';

/// See also [pressedNumUseCase].
@ProviderFor(pressedNumUseCase)
final pressedNumUseCaseProvider =
    AutoDisposeProvider<PressedNumUseCase>.internal(
  pressedNumUseCase,
  name: r'pressedNumUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pressedNumUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PressedNumUseCaseRef = AutoDisposeProviderRef<PressedNumUseCase>;
String _$pressedContinueUseCaseHash() =>
    r'09f30354ae121d5b1d83f2e257d25cbb76f87b1c';

/// See also [pressedContinueUseCase].
@ProviderFor(pressedContinueUseCase)
final pressedContinueUseCaseProvider =
    AutoDisposeProvider<PressedContinueUseCase>.internal(
  pressedContinueUseCase,
  name: r'pressedContinueUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pressedContinueUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PressedContinueUseCaseRef
    = AutoDisposeProviderRef<PressedContinueUseCase>;
String _$exitGamePageUseCaseHash() =>
    r'2de97407b8194e98539e3de13680f864acb1543a';

/// See also [exitGamePageUseCase].
@ProviderFor(exitGamePageUseCase)
final exitGamePageUseCaseProvider =
    AutoDisposeProvider<ExitGamePageUseCase>.internal(
  exitGamePageUseCase,
  name: r'exitGamePageUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exitGamePageUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExitGamePageUseCaseRef = AutoDisposeProviderRef<ExitGamePageUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
