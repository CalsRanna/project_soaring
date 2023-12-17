import 'dart:math';

import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/label.dart';

class Generator {
  Item item() {
    final random = Random();
    var item = Item();
    item.name = 'Item ${random.nextInt(100)}';
    item.description = 'Description ${random.nextInt(100)}';
    item.type = random.nextInt(2);
    return item;
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

  Trait recast(Item item) {
    final random = Random();
    final type = random.nextInt(16);
    var trait = Trait();
    trait.type = type;
    trait.modification = random.nextInt(100) + 1;
    return trait;
  }
}
