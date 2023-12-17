import 'package:isar/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment.g.dart';

@riverpod
class EquippedEquipmentsNotifier extends _$EquippedEquipmentsNotifier {
  @override
  Future<List<Equipment>> build() async {
    final builder = isar.equipments.filter();
    final equipments = await builder.equippedEqualTo(true).findAll();
    return equipments;
  }

  Future<void> takeoff(Equipment equipment) async {
    equipment.equipped = false;
    await isar.writeTxn(() async {
      await isar.equipments.put(equipment);
    });
    ref.invalidateSelf();
    ref.invalidate(availableEquipmentsNotifierProvider(null));
    ref.invalidate(availableEquipmentsNotifierProvider(equipment.position));
    await future;
  }
}

@riverpod
class AvailableEquipmentsNotifier extends _$AvailableEquipmentsNotifier {
  @override
  Future<List<Equipment>> build(int? position) async {
    var builder = isar.equipments.filter();
    if (position != null) {
      builder = builder.positionEqualTo(position);
    }
    final equipments = await builder
        .equippedEqualTo(false)
        .sortByScoreDesc()
        .thenByPosition()
        .thenByRankDesc()
        .findAll();
    return equipments;
  }

  Future<void> mock() async {
    final builder = isar.equipments.filter();
    final exist = await builder.equippedEqualTo(false).findAll();
    if (exist.isNotEmpty) return;
    final generator = Generator();
    final List<Equipment> equipments = [];
    for (var i = 0; i < 100; i++) {
      equipments.add(generator.equipment());
    }
    await isar.writeTxn(() async {
      await isar.equipments.clear();
      await isar.equipments.putAll(equipments);
    });
    ref.invalidateSelf();
    await future;
  }

  Future<void> equip(Equipment equipment) async {
    final equipments = await ref.read(
      equippedEquipmentsNotifierProvider.future,
    );
    var samePosition = equipments
        .where((element) => element.position == equipment.position)
        .firstOrNull;
    if (samePosition != null) {
      samePosition.equipped = false;
      await isar.writeTxn(() async {
        await isar.equipments.put(samePosition);
      });
    }
    equipment.equipped = true;
    await isar.writeTxn(() async {
      await isar.equipments.put(equipment);
    });
    ref.invalidateSelf();
    ref.invalidate(availableEquipmentsNotifierProvider(equipment.position));
    ref.invalidate(equippedEquipmentsNotifierProvider);
    await future;
  }
}
