import 'dart:math';

import 'package:project_soaring/core/combat/combat_result.dart';
import 'package:project_soaring/core/combat/combat_round.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/util/string_extension.dart';

class CombatController {
  Character character;
  Creature creature;
  var _round = CombatRound.character;

  CombatController({required this.character, required this.creature});

  CombatResult combat() {
    if (_round == CombatRound.character) {
      var damage = max(character.attack - creature.defense, 1) * _damageTimes;
      _round = CombatRound.creature;
      var args = [character.name, creature.name, damage];
      return CombatResult()
        ..log = Strings.combatLog.format(args)
        ..characterDamage = damage;
    } else {
      var damage = max(creature.attack - character.defense, 1) * _damageTimes;
      _round = CombatRound.character;
      var args = [creature.name, character.name, damage];
      return CombatResult()
        ..log = Strings.combatLog.format(args)
        ..creatureDamage = damage;
    }
  }

  int get _damageTimes => Random.secure().nextDouble() < 0.1 ? 2 : 1;
}
