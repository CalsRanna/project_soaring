import 'dart:math';

import 'package:project_soaring/game/item/item.dart';

class LootManager {
  final List<Item> items = [];
  int experience = 0;
  int gold = 0;

  final _random = Random();

  void loot({required int level, required int rank}) {
    final count = _random.nextInt(10);
    for (var i = 0; i < count; i++) {
      if (_random.nextBool()) {
        items.add(_lootEquipment(level: level, rank: rank));
      } else {
        items.add(_lootItem());
      }
    }
    experience = _random.nextInt(100) + 1;
    gold = _random.nextInt(100) + 1;
  }

  Item _lootEquipment({required int level, required int rank}) {
    var item = Item();
    // item.type = 0;
    // const config = SoaringText.equipments;
    // final position = _random.nextInt(12);
    // final index = _random.nextInt(config.length);
    // item.name = config[min(position, 10)][index]['name'] ?? '';
    // item.description = config[min(position, 10)][index]['description'] ?? '';
    // item.level = level + _random.nextInt(3);
    // item.rank = rank;
    // item.position = position;
    // final count = _random.nextInt(5) + 1;
    // for (var i = 0; i < count; i++) {
    //   var trait = Trait();
    //   trait.type = _random.nextInt(16);
    //   trait.value = _random.nextInt(100) + 1;
    //   item.traits.add(trait);
    // }
    return item;
  }

  Item _lootItem() {
    var item = Item();
    // item.type = 1;
    // item.count = _random.nextInt(20) + 1;
    // const config = SoaringText.items;
    // final index = _random.nextInt(config.length);
    // item.name = config[index]['name']!;
    // item.description = config[index]['description']!;
    // item.rank = 1;
    return item;
  }
}
