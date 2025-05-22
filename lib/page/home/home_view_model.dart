import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/core/loot/loot_controller.dart';
import 'package:project_soaring/router/router.gr.dart';
import 'package:signals/signals.dart';

class HomeViewModel {
  final character = Signal(Character());
  final items = signal(<Item>[]);
  final selectedIndex = signal(0);

  late final currency = computed(() {
    var specifiedItems = items.value.where(
      (item) => item.type == 1 && item.name.contains('灵石'),
    );
    var total = 0;
    for (var item in specifiedItems) {
      total += item.count * pow(100, item.rank - 1).toInt();
    }
    return total;
  });

  final pageController = PageController(initialPage: 0);
  late final TabController tabController;

  void selectIndex(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  void enterMap(BuildContext context, int index) {
    AutoRouter.of(context).push(CombatRoute());
  }

  Future<void> initSignal() async {
    character.value = Character()..name = '苏九尾';
    items.value = [
      Item()
        ..count = 1000
        ..name = '下品灵石'
        ..description = '修仙界最基础的灵石，也是最常见的货币，蕴含着较少的灵气。'
        ..rank = 1,
      Item()
        ..count = 10000
        ..name = '中品灵石'
        ..description = '修仙界比较基础的灵石，蕴含着较多的灵气。'
        ..rank = 2,
      Item()
        ..count = 900
        ..name = '上品灵石'
        ..description = '修仙界比较好的灵石，蕴含着较多的灵气。'
        ..rank = 3,
      Item()
        ..count = 20
        ..name = '极品灵石'
        ..description = '修仙界最好的灵石，蕴含着最多的灵气。'
        ..rank = 4,
    ];
    var lootController = LootController();
    for (var i = 0; i < 100; i++) {
      items.value.add(lootController.generateLoot());
    }
  }

  void initTabController(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync);
  }

  void dispose() {
    pageController.dispose();
    tabController.dispose();
  }

  void increaseExperience(int experience) {
    var level = character.value.level;
    var maxExperience = (pow(level, 3) * 100).toInt();
    var newExperience = character.value.experience + experience;
    var newLevel = level;
    while (newExperience >= maxExperience) {
      newExperience = newExperience - maxExperience;
      newLevel++;
      maxExperience = (pow(newLevel, 3) * 100).toInt();
    }
    character.value = character.value.copyWith(
      experience: newExperience,
      level: newLevel,
    );
  }

  void addItems(List<Item> items) {
    this.items.value = [...this.items.value, ...items];
  }
}
