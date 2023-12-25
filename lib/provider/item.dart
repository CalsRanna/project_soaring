import 'package:isar/isar.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item.g.dart';

@riverpod
class ItemsNotifier extends _$ItemsNotifier {
  @override
  Future<List<Item>> build() async {
    final items = await isar.items.filter().typeEqualTo(0).findAll();
    return items;
  }

  Future<void> add(Item item) async {
    await isar.writeTxn(() async {
      await isar.items.put(item);
    });
    ref.invalidateSelf();
  }
}

@riverpod
Future<List<Item>> availableEquipments(AvailableEquipmentsRef ref) async {
  final items = await ref.watch(itemsNotifierProvider.future);
  return items.where((item) => item.type == 1).toList();
}
