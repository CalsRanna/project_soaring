import 'dart:math';

abstract class Formula {
  static int levelUp(int level) {
    double rate = 100 / 6;
    num computation = pow(level, 3) - level;
    return (computation * rate + 100).toInt();
  }
}
