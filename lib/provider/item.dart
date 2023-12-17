import 'package:isar/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item.g.dart';

@riverpod
class ItemsNotifier extends _$ItemsNotifier {
  @override
  Future<List<Item>> build() async {
    final items = await isar.items.where().findAll();
    return items;
  }

  Future<void> mock() async {
    final value = state.value;
    if (value == null || value.isNotEmpty) return;
    final generator = Generator();
    final List<Item> items = [];
    for (var i = 0; i < 100; i++) {
      items.add(generator.item());
    }
    await isar.writeTxn(() async {
      await isar.items.clear();
      await isar.items.putAll(items);
    });
    ref.invalidateSelf();
    await future;
  }
}

@riverpod
Future<List<Item>> availableEquipments(AvailableEquipmentsRef ref) async {
  final items = await ref.watch(itemsNotifierProvider.future);
  return items.where((item) => item.type == 1).toList();
}
