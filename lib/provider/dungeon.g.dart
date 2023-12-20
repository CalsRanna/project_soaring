// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dungeon.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dungeonHash() => r'703bb7c5e4267c82e79714db38f0dd1d42069e10';

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

/// See also [dungeon].
@ProviderFor(dungeon)
const dungeonProvider = DungeonFamily();

/// See also [dungeon].
class DungeonFamily extends Family<AsyncValue<Dungeon?>> {
  /// See also [dungeon].
  const DungeonFamily();

  /// See also [dungeon].
  DungeonProvider call(
    int id,
  ) {
    return DungeonProvider(
      id,
    );
  }

  @override
  DungeonProvider getProviderOverride(
    covariant DungeonProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'dungeonProvider';
}

/// See also [dungeon].
class DungeonProvider extends AutoDisposeFutureProvider<Dungeon?> {
  /// See also [dungeon].
  DungeonProvider(
    int id,
  ) : this._internal(
          (ref) => dungeon(
            ref as DungeonRef,
            id,
          ),
          from: dungeonProvider,
          name: r'dungeonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dungeonHash,
          dependencies: DungeonFamily._dependencies,
          allTransitiveDependencies: DungeonFamily._allTransitiveDependencies,
          id: id,
        );

  DungeonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Dungeon?> Function(DungeonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DungeonProvider._internal(
        (ref) => create(ref as DungeonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Dungeon?> createElement() {
    return _DungeonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DungeonProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DungeonRef on AutoDisposeFutureProviderRef<Dungeon?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DungeonProviderElement extends AutoDisposeFutureProviderElement<Dungeon?>
    with DungeonRef {
  _DungeonProviderElement(super.provider);

  @override
  int get id => (origin as DungeonProvider).id;
}

String _$dungeonsNotifierHash() => r'55327e5364e464b2a2c5dca2dd02ea03fb614d5f';

/// See also [DungeonsNotifier].
@ProviderFor(DungeonsNotifier)
final dungeonsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<DungeonsNotifier, List<Dungeon>>.internal(
  DungeonsNotifier.new,
  name: r'dungeonsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dungeonsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DungeonsNotifier = AutoDisposeAsyncNotifier<List<Dungeon>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
