// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startGameSessionUseCaseHash() =>
    r'16431572a1b947359dfabce184c5559d7ab3f556';

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
    String constName,
  ) {
    return StartGameSessionUseCaseProvider(
      constName,
    );
  }

  @override
  StartGameSessionUseCaseProvider getProviderOverride(
    covariant StartGameSessionUseCaseProvider provider,
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
  String? get name => r'startGameSessionUseCaseProvider';
}

/// See also [startGameSessionUseCase].
class StartGameSessionUseCaseProvider
    extends AutoDisposeProvider<StartGameSessionUseCase> {
  /// See also [startGameSessionUseCase].
  StartGameSessionUseCaseProvider(
    String constName,
  ) : this._internal(
          (ref) => startGameSessionUseCase(
            ref as StartGameSessionUseCaseRef,
            constName,
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
          constName: constName,
        );

  StartGameSessionUseCaseProvider._internal(
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
        constName: constName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<StartGameSessionUseCase> createElement() {
    return _StartGameSessionUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartGameSessionUseCaseProvider &&
        other.constName == constName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StartGameSessionUseCaseRef
    on AutoDisposeProviderRef<StartGameSessionUseCase> {
  /// The parameter `constName` of this provider.
  String get constName;
}

class _StartGameSessionUseCaseProviderElement
    extends AutoDisposeProviderElement<StartGameSessionUseCase>
    with StartGameSessionUseCaseRef {
  _StartGameSessionUseCaseProviderElement(super.provider);

  @override
  String get constName => (origin as StartGameSessionUseCaseProvider).constName;
}

String _$pressedNumUseCaseHash() => r'b68c8ae7f270011d0e2311bb38dafe8738914084';

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
    r'f287e56071f4b7f128a5d02195d3962988ebd854';

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
    r'c6ed9c16c2c83b4a80f243a3ca9e15c25d23a357';

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
