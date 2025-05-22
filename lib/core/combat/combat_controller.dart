import 'dart:math';

import 'package:project_soaring/core/combat/combat_result.dart';
import 'package:project_soaring/core/combat/combat_round.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/core/loot/loot_controller.dart';

class CombatController {
  Character character;
  Creature creature;
  var _round = CombatRound.character;

  CombatController({required this.character, required this.creature});

  CombatResult next() {
    var random = Random.secure();
    if (_round == CombatRound.character) {
      var damage = random.nextInt(100);
      var loot =
          random.nextBool() ? [LootController().generateLoot(type: 1)] : null;
      _round = CombatRound.creature;
      return CombatResult()
        ..log = '${character.name} 攻击 ${creature.name}, 造成 $damage 点伤害'
        ..damage = damage
        ..loot = loot
        ..winner = character.name;
    } else {
      var damage = random.nextInt(100);
      _round = CombatRound.character;
      return CombatResult()
        ..log = '${creature.name} 攻击 ${character.name}, 造成 $damage 点伤害'
        ..damage = damage
        ..winner = creature.name;
    }
  }
}
