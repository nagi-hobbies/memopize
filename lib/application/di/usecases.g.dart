// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadConstDataUseCaseHash() =>
    r'54759de24e85a1b99e27e09c0f3eedc69bc9d27a';

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

/// See also [loadConstDataUseCase].
@ProviderFor(loadConstDataUseCase)
const loadConstDataUseCaseProvider = LoadConstDataUseCaseFamily();

/// See also [loadConstDataUseCase].
class LoadConstDataUseCaseFamily extends Family<LoadConstDataUseCase> {
  /// See also [loadConstDataUseCase].
  const LoadConstDataUseCaseFamily();

  /// See also [loadConstDataUseCase].
  LoadConstDataUseCaseProvider call(
    String constName,
  ) {
    return LoadConstDataUseCaseProvider(
      constName,
    );
  }

  @override
  LoadConstDataUseCaseProvider getProviderOverride(
    covariant LoadConstDataUseCaseProvider provider,
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
  String? get name => r'loadConstDataUseCaseProvider';
}

/// See also [loadConstDataUseCase].
class LoadConstDataUseCaseProvider
    extends AutoDisposeProvider<LoadConstDataUseCase> {
  /// See also [loadConstDataUseCase].
  LoadConstDataUseCaseProvider(
    String constName,
  ) : this._internal(
          (ref) => loadConstDataUseCase(
            ref as LoadConstDataUseCaseRef,
            constName,
          ),
          from: loadConstDataUseCaseProvider,
          name: r'loadConstDataUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadConstDataUseCaseHash,
          dependencies: LoadConstDataUseCaseFamily._dependencies,
          allTransitiveDependencies:
              LoadConstDataUseCaseFamily._allTransitiveDependencies,
          constName: constName,
        );

  LoadConstDataUseCaseProvider._internal(
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
    LoadConstDataUseCase Function(LoadConstDataUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadConstDataUseCaseProvider._internal(
        (ref) => create(ref as LoadConstDataUseCaseRef),
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
    return _LoadConstDataUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadConstDataUseCaseProvider &&
        other.constName == constName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, constName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadConstDataUseCaseRef on AutoDisposeProviderRef<LoadConstDataUseCase> {
  /// The parameter `constName` of this provider.
  String get constName;
}

class _LoadConstDataUseCaseProviderElement
    extends AutoDisposeProviderElement<LoadConstDataUseCase>
    with LoadConstDataUseCaseRef {
  _LoadConstDataUseCaseProviderElement(super.provider);

  @override
  String get constName => (origin as LoadConstDataUseCaseProvider).constName;
}

String _$pressedNumUseCaseHash() => r'897273a6ad508c986ccc76b92283124277418c55';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
