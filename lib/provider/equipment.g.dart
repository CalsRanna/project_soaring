// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$equippedEquipmentsNotifierHash() =>
    r'2b38c89ae4c61b02d70d88a9e8cd59a63eb2ace4';

/// See also [EquippedEquipmentsNotifier].
@ProviderFor(EquippedEquipmentsNotifier)
final equippedEquipmentsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    EquippedEquipmentsNotifier, List<Item>>.internal(
  EquippedEquipmentsNotifier.new,
  name: r'equippedEquipmentsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equippedEquipmentsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquippedEquipmentsNotifier = AutoDisposeAsyncNotifier<List<Item>>;
String _$availableEquipmentsNotifierHash() =>
    r'9ce47ba05c977df9da3dbf30e12e4d94dad4d68a';

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

abstract class _$AvailableEquipmentsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Item>> {
  late final int? position;

  FutureOr<List<Item>> build(
    int? position,
  );
}

/// See also [AvailableEquipmentsNotifier].
@ProviderFor(AvailableEquipmentsNotifier)
const availableEquipmentsNotifierProvider = AvailableEquipmentsNotifierFamily();

/// See also [AvailableEquipmentsNotifier].
class AvailableEquipmentsNotifierFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [AvailableEquipmentsNotifier].
  const AvailableEquipmentsNotifierFamily();

  /// See also [AvailableEquipmentsNotifier].
  AvailableEquipmentsNotifierProvider call(
    int? position,
  ) {
    return AvailableEquipmentsNotifierProvider(
      position,
    );
  }

  @override
  AvailableEquipmentsNotifierProvider getProviderOverride(
    covariant AvailableEquipmentsNotifierProvider provider,
  ) {
    return call(
      provider.position,
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
  String? get name => r'availableEquipmentsNotifierProvider';
}

/// See also [AvailableEquipmentsNotifier].
class AvailableEquipmentsNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AvailableEquipmentsNotifier,
        List<Item>> {
  /// See also [AvailableEquipmentsNotifier].
  AvailableEquipmentsNotifierProvider(
    int? position,
  ) : this._internal(
          () => AvailableEquipmentsNotifier()..position = position,
          from: availableEquipmentsNotifierProvider,
          name: r'availableEquipmentsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$availableEquipmentsNotifierHash,
          dependencies: AvailableEquipmentsNotifierFamily._dependencies,
          allTransitiveDependencies:
              AvailableEquipmentsNotifierFamily._allTransitiveDependencies,
          position: position,
        );

  AvailableEquipmentsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.position,
  }) : super.internal();

  final int? position;

  @override
  FutureOr<List<Item>> runNotifierBuild(
    covariant AvailableEquipmentsNotifier notifier,
  ) {
    return notifier.build(
      position,
    );
  }

  @override
  Override overrideWith(AvailableEquipmentsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AvailableEquipmentsNotifierProvider._internal(
        () => create()..position = position,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        position: position,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AvailableEquipmentsNotifier,
      List<Item>> createElement() {
    return _AvailableEquipmentsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableEquipmentsNotifierProvider &&
        other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AvailableEquipmentsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Item>> {
  /// The parameter `position` of this provider.
  int? get position;
}

class _AvailableEquipmentsNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AvailableEquipmentsNotifier,
        List<Item>> with AvailableEquipmentsNotifierRef {
  _AvailableEquipmentsNotifierProviderElement(super.provider);

  @override
  int? get position => (origin as AvailableEquipmentsNotifierProvider).position;
}

String _$lootEquipmentsNotifierHash() =>
    r'ab678fd555414e706b9ade6c13c7b85f74ddfc2f';

/// See also [LootEquipmentsNotifier].
@ProviderFor(LootEquipmentsNotifier)
final lootEquipmentsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    LootEquipmentsNotifier, List<Item>>.internal(
  LootEquipmentsNotifier.new,
  name: r'lootEquipmentsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lootEquipmentsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LootEquipmentsNotifier = AutoDisposeAsyncNotifier<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
