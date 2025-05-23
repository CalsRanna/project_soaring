import 'package:project_soaring/core/creature/creature.dart';

extension CreatureExtension on Creature {
  String get levelString {
    var levels = ['练气', '筑基', '金丹', '元婴', '化神', '出窍', '大乘'];
    var stages = ['前期', '中期', '后期', '圆满'];
    var levelIndex = level ~/ 10;
    var stageIndex = level % 10;
    var stage = switch (stageIndex) {
      0 => stages[3],
      <= 3 => stages[0],
      <= 6 => stages[1],
      <= 9 => stages[2],
      _ => stages[3],
    };
    return '【${levels[levelIndex]}$stage】';
  }
}
