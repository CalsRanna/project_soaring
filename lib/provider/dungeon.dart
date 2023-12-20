import 'dart:math';

import 'package:isar/isar.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/event.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/util/label.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dungeon.g.dart';

@riverpod
class DungeonsNotifier extends _$DungeonsNotifier {
  @override
  Future<List<Dungeon>> build() async {
    final dungeons = await isar.dungeons.where().findAll();
    return dungeons;
  }

  Future<void> create() async {
    final dungeon = Generator().dungeon();
    await isar.writeTxn(() async {
      await isar.dungeons.put(dungeon);
    });
    ref.invalidateSelf();
    await future;
  }

  Future<String?> discover() async {
    final random = Random();
    final rate = random.nextDouble();
    if (rate >= 0.05) return null;
    final availableDungeons = await ref.read(dungeonsNotifierProvider.future);
    const dungeons = Labels.dungeons;
    if (availableDungeons.length >= dungeons.length) return null;
    int index;
    String? name;
    Dungeon? exist;
    do {
      index = random.nextInt(dungeons.length);
      name = dungeons[index]['name'];
      exist = availableDungeons
          .where((dungeon) => dungeon.name == name)
          .firstOrNull;
    } while (exist != null);
    final dungeon = Generator().dungeon(index: index);
    await isar.writeTxn(() async {
      isar.dungeons.put(dungeon);
    });
    ref.invalidateSelf();
    return dungeon.name;
  }

  Future<void> rogueLiteTiles(int id) async {
    final dungeon = await isar.dungeons.get(id);
    if (dungeon == null) return;
    dungeon.tiles = Generator().rogueLiteTiles(dungeon);
    await isar.writeTxn(() async {
      isar.dungeons.put(dungeon);
    });
    ref.invalidateSelf();
  }
}

@riverpod
Future<Dungeon?> dungeon(DungeonRef ref, int id) async {
  final dungeons = await ref.watch(dungeonsNotifierProvider.future);
  return dungeons.where((dungeon) => dungeon.id == id).firstOrNull;
}

@riverpod
class TileNotifier extends _$TileNotifier {
  @override
  Future<Tile?> build({required int dungeonId, required int index}) async {
    final dungeon = await ref.watch(dungeonProvider(dungeonId).future);
    return dungeon?.tiles[index];
  }

  Future<Creature> creature() async {
    final tile = await future;
    tile?.explored = true;
    ref.invalidateSelf();
    final creature = Generator().spawn();
    await isar.writeTxn(() async {
      await isar.creatures.put(creature);
    });
    ref.invalidate(creatureNotifierProvider);
    return creature;
  }

  Future<Event> event() async {
    final tile = await future;
    tile?.explored = true;
    tile?.type = 1;
    ref.invalidateSelf();
    return Generator().event();
  }

  Future<void> explore() async {
    final tile = await future;
    tile?.explored = true;
    ref.invalidateSelf();
  }
}
