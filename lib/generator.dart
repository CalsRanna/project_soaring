import 'dart:math';

import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';

class Generator {
  Item item() {
    final random = Random();
    var item = Item();
    item.name = 'Item ${random.nextInt(100)}';
    item.level = random.nextInt(6);
    item.description = 'Description ${random.nextInt(100)}';
    item.type = random.nextInt(2);
    item.position = random.nextInt(14) + 1;
    return item;
  }

  Equipment equipment() {
    final random = Random();
    var equipment = Equipment();
    equipment.name = 'Equipment ${random.nextInt(100)}';
    final level = random.nextInt(6);
    equipment.level = level;
    equipment.description = 'Description ${random.nextInt(100)}';
    equipment.type = 1;
    equipment.position = random.nextInt(14) + 1;
    final count = random.nextInt(10) + 1;
    for (var i = 0; i < count; i++) {
      final type = random.nextInt(16);
      var trait = Trait();
      trait.type = type;
      trait.modification =
          ((random.nextInt(100) + 1) * (level + 1) * 0.7).round();
      equipment.traits.add(trait);
    }
    equipment.traits.sort((a, b) => a.type.compareTo(b.type));
    return equipment;
  }

  Trait recast(Item item) {
    final random = Random();
    final type = random.nextInt(16);
    var trait = Trait();
    trait.type = type;
    trait.modification =
        ((random.nextInt(100) + 1) * (item.level + 1) * 0.7).round();
    return trait;
  }
}
