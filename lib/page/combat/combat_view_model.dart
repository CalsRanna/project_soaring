import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/core/combat/combat_controller.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:signals/signals_flutter.dart';

class CombatViewModel {
  final logs = signal(<String>[]);
  final logController = ScrollController();
  final loots = signal(<Item>[]);
  late final Timer _timer;
  final _character = Character();
  Creature? _creature;
  late CombatController _combatController;

  void dispose() {
    logController.dispose();
    _timer.cancel();
  }

  void combat() {
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_creature == null) {
        if (logs.value.isNotEmpty && logs.value.last != 'Seeking Cr') {
          logs.value = [];
        }
        _seekCreature();
        return;
      }
      var result = _combatController.next();
      logs.value = [...logs.value, result.log];
      if (result.damage >= 80) {
        logs.value = [...logs.value, 'C E'];
        if (result.loot != null) {
          loots.value = [...loots.value, ...result.loot!];
          var homeViewModel = GetIt.instance.get<HomeViewModel>();
          homeViewModel.addItems(result.loot!);
        }
        _creature = null;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!logController.hasClients) return;
        logController.animateTo(
          logController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void _seekCreature() {
    logs.value = [...logs.value, 'Seeking Cr'];
    var random = Random.secure();
    if (random.nextInt(100) < 50) {
      _creature = Creature();
      _combatController = CombatController(
        character: _character,
        creature: _creature!,
      );
    }
  }
}
