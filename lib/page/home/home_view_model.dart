import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/router/router.gr.dart';
import 'package:signals/signals.dart';

class HomeViewModel {
  final character = Signal(Character());
  final items = signal(<Item>[]);
  final selectedIndex = signal(0);

  late final currency = computed(
    () => items.value.where((item) => item.type == 0).firstOrNull?.count ?? 0,
  );

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
    character.value = Character()..name = 'Cals';
    items.value = [Item()..count = 1000];
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
