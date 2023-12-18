import 'dart:math';

import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/label.dart';

class Generator {
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

  Creature spawn() {
    final random = Random();
    var creature = Creature();
    creature.name = 'Creature ${random.nextInt(100)}';
    creature.attack = random.nextInt(100) + 1;
    creature.defense = random.nextInt(100) + 1;
    creature.level = random.nextInt(60) + 1;
    creature.life = random.nextInt(100) + 1;
    creature.mana = random.nextInt(100) + 1;
    creature.rank = random.nextInt(4);
    return creature;
  }

  Dungeon dungeon() {
    final random = Random();
    var dungeon = Dungeon();
    dungeon.name = 'Dungeon ${random.nextInt(100)}';
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
}
