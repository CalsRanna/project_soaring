import 'dart:math';

import 'package:isar/isar.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment.g.dart';

@riverpod
class EquippedEquipmentsNotifier extends _$EquippedEquipmentsNotifier {
  @override
  Future<List<Item>> build() async {
    final builder = isar.items.filter();
    final equipments = await builder.equippedEqualTo(true).findAll();
    return equipments;
  }

  Future<void> takeoff(Item equipment) async {
    equipment.equipped = false;
    await isar.writeTxn(() async {
      await isar.items.put(equipment);
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
  Future<List<Item>> build(int? position) async {
    var builder = isar.items.filter();
    if (position != null) {
      builder = builder.positionEqualTo(position);
    }
    final equipments = await builder
        .typeEqualTo(0)
        .equippedEqualTo(false)
        .sortByScoreDesc()
        .thenByPosition()
        .thenByRankDesc()
        .findAll();
    return equipments;
  }

  Future<void> equip(Item equipment) async {
    final equipments = await ref.read(
      equippedEquipmentsNotifierProvider.future,
    );
    var samePosition = equipments
        .where((element) => element.position == equipment.position)
        .firstOrNull;
    if (samePosition != null) {
      samePosition.equipped = false;
      await isar.writeTxn(() async {
        await isar.items.put(samePosition);
      });
    }
    equipment.equipped = true;
    await isar.writeTxn(() async {
      await isar.items.put(equipment);
    });
    ref.invalidateSelf();
    ref.invalidate(availableEquipmentsNotifierProvider(equipment.position));
    ref.invalidate(equippedEquipmentsNotifierProvider);
    await future;
  }

  Future<void> sold(Item equipment) async {
    final gold = pow(equipment.score, 1.5).round() + (equipment.rank + 1) * 10;
    final character = await ref.read(characterNotifierProvider.future);
    if (character == null) return;
    character.gold += gold;
    await isar.writeTxn(() async {
      await isar.items.delete(equipment.id);
      await isar.characters.put(character);
    });
    ref.invalidateSelf();
    ref.invalidate(availableEquipmentsNotifierProvider(equipment.position));
    ref.invalidate(characterNotifierProvider);
    await future;
  }
}

@riverpod
class LootEquipmentsNotifier extends _$LootEquipmentsNotifier {
  @override
  Future<List<Item>> build() async {
    return [];
  }

  Future<void> loot() async {
    final equipment = Generator().equipment();
    await isar.writeTxn(() async {
      await isar.items.put(equipment);
    });
    final previousState = await future;
    final equipments = [...previousState, equipment];
    equipments.sort((a, b) => b.score.compareTo(a.score));
    state = AsyncData(equipments);
  }
}
