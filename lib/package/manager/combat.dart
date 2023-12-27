import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_soaring/package/model/combat.dart';
import 'package:project_soaring/package/type/combat.dart';

class SoaringCombatManager {
  final Size battlegroundSize;
  final List<SoaringCombatEntry> entries = [];
  bool fastSimulate = false;
  final int maxRound = 20;
  int round = 1;
  String winner = '';
  final void Function(int)? onLoop;

  SoaringCombatManager({required this.battlegroundSize, this.onLoop});

  List<SoaringCombatEntry> get defenders {
    return entries.where((entry) {
      return entry.position == SoaringCombatPosition.defender && entry.isAlive;
    }).toList();
  }

  List<SoaringCombatEntry> get offenders {
    return entries.where((entry) {
      return entry.position == SoaringCombatPosition.offender && entry.isAlive;
    }).toList();
  }

  void simulate() async {
    final random = Random();
    while (round <= maxRound && offenders.isNotEmpty && defenders.isNotEmpty) {
      for (var i = 0; i < entries.length; i++) {
        final entry = entries[i];
        if (!entry.isAlive) {
          continue;
        }
        if (offenders.isEmpty || defenders.isEmpty) {
          winner = defenders.isEmpty ? 'offenders' : 'defenders';
          break;
        }
        SoaringCombatEntry target =
            entry.position == SoaringCombatPosition.offender
                ? defenders[random.nextInt(defenders.length)]
                : offenders[random.nextInt(offenders.length)];
        if (fastSimulate) {
          entry.cast(target);
        } else {
          await _round(entry, target);
        }
        if (round > maxRound || offenders.isEmpty || defenders.isEmpty) {
          winner = defenders.isEmpty ? 'offenders' : 'defenders';
          break;
        }
      }
      round++;
    }
  }

  void skip() {
    fastSimulate = true;
  }

  void spawn(List<SoaringCombatEntry> entries) {
    this.entries.addAll(entries);
    _spawnEntries(offenders);
    _spawnEntries(defenders);
  }

  Future<void> _round(
      SoaringCombatEntry entry, SoaringCombatEntry target) async {
    entry.move(target);
    onLoop?.call(round);
    await Future.delayed(const Duration(milliseconds: 200));
    entry.cast(target);
    onLoop?.call(round);
    entry.retreat();
    onLoop?.call(round);
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  // entries中每个entry的position必须相同
  void _spawnEntries(List<SoaringCombatEntry> entries) {
    if (entries.isEmpty) return;
    final height = battlegroundSize.height / entries.length;
    final width = battlegroundSize.width / 2;
    final offset =
        entries.first.position == SoaringCombatPosition.offender ? 0 : width;
    for (var i = 0; i < entries.length; i++) {
      var entry = entries[i];
      var x = (width - entry.size.width) / 2 + offset;
      var y = (height - entry.size.height) / 2 + i * height;
      entry.spawn(x, y);
    }
  }
}
