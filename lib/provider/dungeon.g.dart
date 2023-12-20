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

String _$dungeonsNotifierHash() => r'd5017a1f94aec01e0bd8d8b7ee3039e8decf6fcc';

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
String _$tileNotifierHash() => r'dc0043c8277cbf1933ce4722516f4125d4a5931e';

abstract class _$TileNotifier extends BuildlessAutoDisposeAsyncNotifier<Tile?> {
  late final int dungeonId;
  late final int index;

  FutureOr<Tile?> build({
    required int dungeonId,
    required int index,
  });
}

/// See also [TileNotifier].
@ProviderFor(TileNotifier)
const tileNotifierProvider = TileNotifierFamily();

/// See also [TileNotifier].
class TileNotifierFamily extends Family<AsyncValue<Tile?>> {
  /// See also [TileNotifier].
  const TileNotifierFamily();

  /// See also [TileNotifier].
  TileNotifierProvider call({
    required int dungeonId,
    required int index,
  }) {
    return TileNotifierProvider(
      dungeonId: dungeonId,
      index: index,
    );
  }

  @override
  TileNotifierProvider getProviderOverride(
    covariant TileNotifierProvider provider,
  ) {
    return call(
      dungeonId: provider.dungeonId,
      index: provider.index,
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
  String? get name => r'tileNotifierProvider';
}

/// See also [TileNotifier].
class TileNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TileNotifier, Tile?> {
  /// See also [TileNotifier].
  TileNotifierProvider({
    required int dungeonId,
    required int index,
  }) : this._internal(
          () => TileNotifier()
            ..dungeonId = dungeonId
            ..index = index,
          from: tileNotifierProvider,
          name: r'tileNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tileNotifierHash,
          dependencies: TileNotifierFamily._dependencies,
          allTransitiveDependencies:
              TileNotifierFamily._allTransitiveDependencies,
          dungeonId: dungeonId,
          index: index,
        );

  TileNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dungeonId,
    required this.index,
  }) : super.internal();

  final int dungeonId;
  final int index;

  @override
  FutureOr<Tile?> runNotifierBuild(
    covariant TileNotifier notifier,
  ) {
    return notifier.build(
      dungeonId: dungeonId,
      index: index,
    );
  }

  @override
  Override overrideWith(TileNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TileNotifierProvider._internal(
        () => create()
          ..dungeonId = dungeonId
          ..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dungeonId: dungeonId,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TileNotifier, Tile?> createElement() {
    return _TileNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TileNotifierProvider &&
        other.dungeonId == dungeonId &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dungeonId.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TileNotifierRef on AutoDisposeAsyncNotifierProviderRef<Tile?> {
  /// The parameter `dungeonId` of this provider.
  int get dungeonId;

  /// The parameter `index` of this provider.
  int get index;
}

class _TileNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TileNotifier, Tile?>
    with TileNotifierRef {
  _TileNotifierProviderElement(super.provider);

  @override
  int get dungeonId => (origin as TileNotifierProvider).dungeonId;
  @override
  int get index => (origin as TileNotifierProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
