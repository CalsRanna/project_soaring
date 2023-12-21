import 'dart:math';

import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/event.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/label.dart';

class Generator {
  late Random random;
  Generator() {
    random = Random();
  }
  Area area({int? level, String? name, String? description}) {
    var area = Area();
    area.level = level ?? random.nextInt(60) + 1;
    const presets = Labels.areas;
    final index = random.nextInt(presets.length);
    area.name = name ?? presets[index]['name']!;
    area.description = description ?? presets[index]['description']!;
    return area;
  }

  String name() {
    final random = Random();
    const firstNames = Labels.firstNames;
    final firstName = firstNames[random.nextInt(firstNames.length)];
    int min = 0x4e00;
    int max = 0x9fa5;
    int unicode = min + random.nextInt(max - min + 1);
    var lastName = String.fromCharCode(unicode);
    if (random.nextBool()) {
      unicode = min + random.nextInt(max - min + 1);
      lastName += String.fromCharCode(unicode);
    }
    return '$firstName$lastName';
  }

  Item item() {
    final random = Random();
    var item = Item();
    item.name = 'Item ${random.nextInt(100)}';
    item.description = 'Description ${random.nextInt(100)}';
    item.type = random.nextInt(2);
    return item;
  }

  List<Equipment> starterKit() {
    var clothes = Equipment();
    clothes.description = '极其常见的粗布衣服。';
    clothes.equipped = true;
    clothes.level = 1;
    clothes.name = '粗布衣服';
    clothes.position = 4;
    clothes.rank = 0;
    clothes.type = 1;
    var trousers = Equipment();
    trousers.description = '极其常见的粗布短裤。';
    trousers.equipped = true;
    trousers.level = 1;
    trousers.name = '粗布短裤';
    trousers.position = 7;
    trousers.rank = 0;
    trousers.type = 1;
    return [clothes, trousers];
  }

  Equipment equipment() {
    final random = Random();
    var equipment = Equipment();
    equipment.position = random.nextInt(12);
    const labels = Labels.equipments;
    final label = labels[equipment.position];
    final length = label.length;
    equipment.name = label[random.nextInt(length)];
    final level = random.nextInt(60) + 1;
    equipment.level = level;
    equipment.description = equipment.name;
    equipment.type = 1;
    final rank = random.nextInt(6);
    equipment.rank = rank;
    var count = random.nextInt(3);
    if (rank > 0) {
      count += random.nextInt(rank);
    }
    for (var i = 0; i < count; i++) {
      final type = random.nextInt(16);
      var trait = Trait();
      trait.type = type;
      trait.modification =
          ((random.nextInt(100) + 1) * (rank + 1) * 0.8).round();
      equipment.traits.add(trait);
    }
    equipment.traits.sort((a, b) => a.type.compareTo(b.type));
    return equipment;
  }

  Trait recast() {
    final random = Random();
    final type = random.nextInt(16);
    var trait = Trait();
    trait.type = type;
    trait.modification = random.nextInt(100) + 1;
    return trait;
  }

  Creature spawn({int? level}) {
    final random = Random();
    const creatures = Labels.creatures;
    final index = random.nextInt(creatures.length);
    var creature = Creature();
    level = level ?? (random.nextInt(100) + 1);
    creature.name = creatures[index];
    creature.attack = level * 8 + random.nextInt(5);
    creature.defense = level * 5 + random.nextInt(5);
    creature.level = level;
    creature.life = level * 10 + random.nextInt(10);
    creature.mana = level * 10 + random.nextInt(10);
    creature.rank = random.nextInt(4);
    return creature;
  }

  Dungeon dungeon({int? index}) {
    const dungeons = Labels.dungeons;
    final random = Random();
    var dungeon = Dungeon();
    dungeon.name = index == null
        ? 'Dungeon ${random.nextInt(100)}'
        : dungeons[index]['name']!;
    dungeon.story = index == null
        ? 'Story ${random.nextInt(100)}'
        : dungeons[index]['story']!;
    dungeon.difficulty = random.nextInt(3);
    for (var i = 0; i < 100; i++) {
      var tile = Tile();
      tile.difficulty = random.nextInt(3);
      tile.x = i ~/ 10;
      tile.y = i % 10;
      tile.type = random.nextInt(4);
      dungeon.tiles.add(tile);
    }
    var start = random.nextInt(100);
    while (dungeon.tiles[start].type == 0) {
      start = random.nextInt(100);
    }
    dungeon.tiles[start].explored = true;
    dungeon.tiles[start].type = 4;
    var end = random.nextInt(100);
    while (dungeon.tiles[end].type == 0 || dungeon.tiles[end].type == 4) {
      end = random.nextInt(100);
    }
    dungeon.tiles[end].type = 5;
    return dungeon;
  }

  List<Tile> rogueLiteTiles(Dungeon dungeon) {
    List<Tile> tiles = [];
    for (var i = 0; i < 100; i++) {
      var tile = Tile();
      tile.difficulty = random.nextInt(3);
      tile.x = i ~/ 10;
      tile.y = i % 10;
      tile.type = random.nextInt(4);
      tiles.add(tile);
    }
    var start = random.nextInt(100);
    while (tiles[start].type == 0) {
      start = random.nextInt(100);
    }
    tiles[start].explored = true;
    tiles[start].type = 4;
    var end = random.nextInt(100);
    while (tiles[end].type == 0 || tiles[end].type == 4) {
      end = random.nextInt(100);
    }
    tiles[end].type = 5;
    return tiles;
  }

  Event event() {
    const events = Labels.events;
    final random = Random();
    final index = random.nextInt(events.length);
    var event = Event();
    event.content = events[index]['content'] ?? 'Random Event';
    event.reward = random.nextInt(5);
    return event;
  }
}
