import 'dart:math';

import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/generator.dart';

class Combat {
  Character character;
  List<int> stats;
  List<String> logs = [];
  int experience = 0;
  int gold = 0;
  List<Item> items = [];
  List<Equipment> equipments = [];
  bool? win;

  Combat({required this.character, required this.stats});

  void attack(Creature creature) {
    final damage = max(stats[0] - creature.defense, 0);
    creature.life -= damage;
    logs.add('${character.name}对${creature.name}造成$damage点伤害。');
  }

  void defense(Creature creature) {
    final damage = max(creature.attack - stats[1], 0);
    stats[2] -= damage;
    logs.add('${creature.name}对${character.name}造成$damage点伤害。');
  }

  void judge(Creature creature) {
    if (stats[2] <= 0) {
      logs.add('${character.name}死亡。');
    } else if (creature.life <= 0) {
      logs.add('${creature.name}死亡。');
    }
  }

  void autoCombat(Creature creature) {
    int round = 0;
    logs.add('战斗开始。');
    while (stats[2] > 0 && creature.life > 0 && round < 10) {
      if (round.isEven) {
        final damage = max(stats[0] - creature.defense, 0);
        creature.life -= damage;
        logs.add(
          '第${round + 1}回合：${character.name}对${creature.name}造成$damage点伤害。',
        );
      } else {
        final damage = max(creature.attack - stats[1], 0);
        stats[2] -= damage;
        logs.add(
          '第${round + 1}回合：${creature.name}对${character.name}造成$damage点伤害。',
        );
      }
      round++;
    }
    win = stats[2] > 0 && round < 10;
    logs.add('战斗${win == true ? '胜利' : '失败'}。');
    if (win == true) {
      loot(creature);
    }
  }

  void loot(Creature creature) {
    final random = Random();
    experience = random.nextInt(100) * (creature.level);
    gold = random.nextInt(100) * (creature.level);
    final count = random.nextInt(max(creature.rank * 5, 1));
    final generator = Generator();
    for (var i = 0; i < count; i++) {
      final equipment = random.nextBool();
      if (equipment) {
        equipments.add(generator.equipment());
      } else {
        items.add(generator.item());
      }
    }
  }
}
