import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/router/router.gr.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:signals/signals.dart';

class HomeViewModel {
  final character = Signal(Character());
  final items = signal(<Item>[]);
  final selectedIndex = signal(0);
  final isExercising = signal(false);
  final equipments = signal(<Item>[]);

  late final score = computed(() {
    return character.value.health +
        character.value.attack +
        character.value.defense;
  });
  late final firstCurrency = computed(() {
    var specifiedItems = items.value.where(
      (item) => item.type == 1 && item.name.contains('灵石') && item.rank == 1,
    );
    var total = 0;
    for (var item in specifiedItems) {
      total += item.count;
    }
    return total;
  });
  late final secondaryCurrency = computed(() {
    var specifiedItems = items.value.where(
      (item) => item.type == 1 && item.name.contains('灵石') && item.rank == 2,
    );
    var total = 0;
    for (var item in specifiedItems) {
      total += item.count;
    }
    return total;
  });
  late final thirdCurrency = computed(() {
    var specifiedItems = items.value.where(
      (item) => item.type == 1 && item.name.contains('灵石') && item.rank == 3,
    );
    var total = 0;
    for (var item in specifiedItems) {
      total += item.count;
    }
    return total;
  });
  late final fourthCurrency = computed(() {
    var specifiedItems = items.value.where(
      (item) => item.type == 1 && item.name.contains('灵石') && item.rank == 4,
    );
    var total = 0;
    for (var item in specifiedItems) {
      total += item.count;
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
    var newItems = [...this.items.value];
    for (var item in items) {
      var index = newItems.indexWhere((i) => i.name == item.name);
      if (index >= 0) {
        newItems[index] = newItems[index].copyWith(
          count: newItems[index].count + item.count,
        );
      } else {
        newItems.add(item);
      }
    }
    this.items.value = newItems;
  }

  void removeItems(List<Item> items) {
    var newItems = [...this.items.value];
    for (var item in items) {
      var index = newItems.indexWhere((i) => i.name == item.name);
      if (index >= 0) {
        newItems[index] = newItems[index].copyWith(
          count: newItems[index].count - item.count,
        );
        if (newItems[index].count <= 0) {
          newItems.removeAt(index);
        }
      }
    }
    this.items.value = newItems;
  }

  void updateIsExercising(bool value) {
    isExercising.value = value;
  }

  void putOnItem(Item item) {
    var newEquipments = [...equipments.value];
    var samePositionIndex = newEquipments.indexWhere(
      (i) => i.position == item.position,
    );
    if (samePositionIndex >= 0) {
      newEquipments[samePositionIndex] = item;
      removeItems([newEquipments[samePositionIndex]]);
    } else {
      newEquipments.add(item);
    }
    equipments.value = [...newEquipments];
    removeItems([item]);
    DialogUtil.instance.dismiss();
  }

  void takeOffItem(Item item) {
    var newEquipments = [...equipments.value];
    var index = newEquipments.indexWhere((i) => i.name == item.name);
    if (index >= 0) {
      newEquipments.removeAt(index);
    }
    equipments.value = [...newEquipments];
    addItems([item]);
    DialogUtil.instance.dismiss();
  }
}
