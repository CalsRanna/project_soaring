// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableEquipmentsHash() =>
    r'e2f5069b6e3e2038adba97154b364b41ce7eb180';

/// See also [availableEquipments].
@ProviderFor(availableEquipments)
final availableEquipmentsProvider =
    AutoDisposeFutureProvider<List<Item>>.internal(
  availableEquipments,
  name: r'availableEquipmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableEquipmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AvailableEquipmentsRef = AutoDisposeFutureProviderRef<List<Item>>;
String _$itemsNotifierHash() => r'b464e7fcee64461e1ceeedf1e38db293fae81078';

/// See also [ItemsNotifier].
@ProviderFor(ItemsNotifier)
final itemsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ItemsNotifier, List<Item>>.internal(
  ItemsNotifier.new,
  name: r'itemsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsNotifier = AutoDisposeAsyncNotifier<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
