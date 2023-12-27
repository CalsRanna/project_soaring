import 'dart:math';

import 'package:project_soaring/package/model/item.dart';

class SoaringLootManager {
  List<SoaringItem> items = [];
  int experience = 0;
  int gold = 0;

  void loot({required int level, required int rank}) {
    final random = Random();
    level += random.nextInt(3);
  }
}
