import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.gr.dart';
import 'package:signals/signals.dart';

class HomeViewModel {
  final selectedIndex = signal(0);
  final pageController = PageController(initialPage: 0);

  void selectIndex(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  void enterMap(BuildContext context, int index) {
    AutoRouter.of(context).push(CombatRoute());
  }
}
