// GENERATED CODE - DO NOT MODIFY BY HAND

part of 's_global_object_key_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalObjectKeyListHash() =>
    r'f3ec94c3b6fe974852bb55b4aa203bc6d98cc0e3';

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

/// See also [globalObjectKeyList].
@ProviderFor(globalObjectKeyList)
const globalObjectKeyListProvider = GlobalObjectKeyListFamily();

/// See also [globalObjectKeyList].
class GlobalObjectKeyListFamily
    extends Family<List<GlobalObjectKey<FlipCardState>>> {
  /// See also [globalObjectKeyList].
  const GlobalObjectKeyListFamily();

  /// See also [globalObjectKeyList].
  GlobalObjectKeyListProvider call({
    int length = 1000,
  }) {
    return GlobalObjectKeyListProvider(
      length: length,
    );
  }

  @override
  GlobalObjectKeyListProvider getProviderOverride(
    covariant GlobalObjectKeyListProvider provider,
  ) {
    return call(
      length: provider.length,
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
  String? get name => r'globalObjectKeyListProvider';
}

/// See also [globalObjectKeyList].
class GlobalObjectKeyListProvider
    extends AutoDisposeProvider<List<GlobalObjectKey<FlipCardState>>> {
  /// See also [globalObjectKeyList].
  GlobalObjectKeyListProvider({
    int length = 1000,
  }) : this._internal(
          (ref) => globalObjectKeyList(
            ref as GlobalObjectKeyListRef,
            length: length,
          ),
          from: globalObjectKeyListProvider,
          name: r'globalObjectKeyListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$globalObjectKeyListHash,
          dependencies: GlobalObjectKeyListFamily._dependencies,
          allTransitiveDependencies:
              GlobalObjectKeyListFamily._allTransitiveDependencies,
          length: length,
        );

  GlobalObjectKeyListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.length,
  }) : super.internal();

  final int length;

  @override
  Override overrideWith(
    List<GlobalObjectKey<FlipCardState>> Function(
            GlobalObjectKeyListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GlobalObjectKeyListProvider._internal(
        (ref) => create(ref as GlobalObjectKeyListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        length: length,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<GlobalObjectKey<FlipCardState>>>
      createElement() {
    return _GlobalObjectKeyListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GlobalObjectKeyListProvider && other.length == length;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, length.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GlobalObjectKeyListRef
    on AutoDisposeProviderRef<List<GlobalObjectKey<FlipCardState>>> {
  /// The parameter `length` of this provider.
  int get length;
}

class _GlobalObjectKeyListProviderElement
    extends AutoDisposeProviderElement<List<GlobalObjectKey<FlipCardState>>>
    with GlobalObjectKeyListRef {
  _GlobalObjectKeyListProviderElement(super.provider);

  @override
  int get length => (origin as GlobalObjectKeyListProvider).length;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
