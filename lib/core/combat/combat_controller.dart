import 'dart:math';

import 'package:project_soaring/core/combat/combat_result.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/core/item/item.dart';

class CombatController {
  Character character;
  Creature creature;
  var _round = CombatRound.character;

  CombatController({required this.character, required this.creature});

  CombatResult next() {
    var random = Random.secure();
    if (_round == CombatRound.character) {
      var damage = random.nextInt(100);
      var loot = random.nextBool() ? [Item()] : null;
      _round = CombatRound.creature;
      return CombatResult()
        ..log = 'Ch a Cr, g $damage D'
        ..damage = damage
        ..loot = loot;
    } else {
      var damage = random.nextInt(100);
      _round = CombatRound.character;
      return CombatResult()
        ..log = 'Cr a Ch, g $damage D'
        ..damage = damage;
    }
  }
}

enum CombatRound { character, creature }
