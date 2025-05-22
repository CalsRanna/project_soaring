import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/core/combat/combat_controller.dart';
import 'package:project_soaring/core/creature/creature.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:signals/signals_flutter.dart';

class CombatViewModel {
  final logs = signal(<String>[]);
  final logController = ScrollController();
  final loots = signal(<Item>[]);
  late final Timer _timer;
  Creature? _creature;
  late CombatController _combatController;

  void dispose() {
    logController.dispose();
    _timer.cancel();
  }

  void combat() {
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_creature == null) {
        if (logs.value.isNotEmpty && logs.value.last != '正在寻找怪物...') {
          logs.value = [];
        }
        _seekCreature();
        return;
      }
      var result = _combatController.next();
      logs.value = [...logs.value, result.log];
      if (result.damage >= 80) {
        logs.value = [...logs.value, '战斗结束，${result.winner}获胜'];
        if (result.loot != null) {
          logs.value = [...logs.value, '获得 ${result.loot!.length} 件战利品'];
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
    logs.value = [...logs.value, '正在寻找怪物...'];
    var random = Random.secure();
    if (random.nextInt(100) < 50) {
      _creature = Creature()..name = '九尾狐';
      var homeViewModel = GetIt.instance.get<HomeViewModel>();
      _combatController = CombatController(
        character: homeViewModel.character.value,
        creature: _creature!,
      );
    }
  }
}
