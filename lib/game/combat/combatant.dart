import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_soaring/game/trait/trait.dart';

class Combatant {
  double x = 0;
  double y = 0;
  CombatantPosition position;
  int rank = 0;
  int level = 0;
  String name = '';
  List<Trait> traits = [];

  double _x = 0;
  double _y = 0;

  int injury = 0;
  final size = const Size(64, 64);
  Combatant({this.position = CombatantPosition.offender});
  int get attack => _calculateTrait(14);

  int get defense => _calculateTrait(15);

  @override
  int get hashCode => Object.hash(runtimeType, x, y, position);
  bool get isAlive => remainLife > 0;

  int get life => _calculateTrait(0);

  int get mana => _calculateTrait(1);

  int get remainLife => max(0, life - injury);

  @override
  bool operator ==(Object other) {
    return other is Combatant &&
        other.x == x &&
        other.y == y &&
        other.position == position;
  }

  int cast(Combatant target) {
    var damage = max(attack - target.defense, 0);
    target.injury += damage;
    return damage;
  }

  void move(Combatant target) {
    int direction = target.position == CombatantPosition.defender ? -1 : 1;
    x = target.x + direction * size.width;
    y = target.y;
  }

  void retreat() {
    x = _x;
    y = _y;
  }

  void spawn(double x, double y) {
    this.x = x;
    this.y = y;
    _x = x;
    _y = y;
  }

  @override
  String toString() {
    return 'SoaringCombatEntry{x: $x, y: $y, position: $position}';
  }

  int _calculateTrait(int type) {
    // final iterator = traits.where((trait) => trait.type == type);
    // if (iterator.isEmpty) return 0;
    // return iterator.fold(0, (previousValue, trait) {
    //   return previousValue + trait.value;
    // });
    return 0;
  }
}

enum CombatantPosition { defender, offender }
