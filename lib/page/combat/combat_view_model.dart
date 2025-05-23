import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/combat/combat_controller.dart';
import 'package:project_soaring/core/combat/combat_result.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/core/loot/loot_controller.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/util/string_extension.dart';
import 'package:signals/signals_flutter.dart';

class CombatViewModel {
  final logs = signal(<String>[]);
  final logController = ScrollController();
  final loots = signal(<Item>[]);
  late final Timer _timer;
  Character? _character;
  Creature? _creature;
  late CombatController _combatController;

  void combat() {
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_creature == null) {
        logs.value = [...logs.value, Strings.combatSeekCreature];
        _creature = seekCreature();
        if (_creature == null) return;
        _resetCharacter();
        _combatController = CombatController(
          character: _character!,
          creature: _creature!,
        );
      }
      var result = _combatController.combat();
      logs.value = [...logs.value, result.log];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!logController.hasClients) return;
        logController.animateTo(
          logController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      });
      _update(result);
    });
  }

  void dispose() {
    logController.dispose();
    _timer.cancel();
  }

  Creature? seekCreature() {
    var random = Random.secure();
    if (random.nextInt(100) < 50) {
      return Creature()
        ..name = '九尾狐'
        ..health = 100
        ..attack = 10
        ..defense = 5;
    }
    return null;
  }

  void _loot() {
    var loot = LootController().generateLoot(type: 1);
    logs.value = [
      ...logs.value,
      Strings.combatLoot.format([loot.name]),
    ];
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    homeViewModel.addItems([loot]);
  }

  void _update(CombatResult result) {
    _character!.health -= result.creatureDamage;
    _creature!.health -= result.characterDamage;
    if (_creature!.health <= 0) {
      logs.value = [
        ...logs.value,
        Strings.combatEnd.format([_character!.name]),
      ];
      _loot();
      _resetCharacter();
      _creature = null;
      return;
    }
    if (_character!.health <= 0) {
      logs.value = [
        ...logs.value,
        Strings.combatEnd.format([_creature!.name]),
      ];
      _resetCharacter();
      _creature = null;
    }
  }

  void _resetCharacter() {
    _character = GetIt.instance.get<HomeViewModel>().character.value.copyWith();
  }
}
