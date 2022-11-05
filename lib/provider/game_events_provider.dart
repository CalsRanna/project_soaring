import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/util/game_helper.dart';

class GameEvent {
  GameEvent({
    required this.date,
    required this.description,
    required this.experienceReward,
    required this.lifetimeReward,
    required this.magicStoneReward,
    required this.probability,
  });

  GameEvent.random()
      : date = DateTime.now(),
        description = '随机事件',
        experienceReward =
            Random().nextDouble() * 1024 * (Random().nextBool() ? 1 : -1),
        lifetimeReward = Random().nextInt(10) * (Random().nextBool() ? 1 : -1),
        magicStoneReward =
            Random().nextInt(1024) * (Random().nextBool() ? 1 : -1),
        probability = Random().nextDouble() * 100;

  DateTime date;
  String description;
  double experienceReward;
  int lifetimeReward;
  int magicStoneReward;
  double probability;

  String get dateString => GameHelper.calculateGameYear(date);

  String get experienceRewardString {
    var string = experienceReward > 0 ? '增加' : '减少';
    var absValue = experienceReward.abs().floor();
    return '修为$string了$absValue';
  }

  Color get experienceRewardColor =>
      experienceReward > 0 ? Colors.lightGreen : Colors.red;

  String get lifetimeRewardString {
    var string = lifetimeReward > 0 ? '增加' : '减少';
    var absValue = lifetimeReward.abs();
    return '寿元$string了$absValue';
  }

  Color get lifetimeRewardColor =>
      lifetimeReward > 0 ? Colors.lightGreen : Colors.red;

  String get magicStoneRewardString {
    var string = magicStoneReward > 0 ? '增加' : '减少';
    var absValue = magicStoneReward.abs();
    return '灵石$string了$absValue';
  }

  Color get magicStoneRewardColor =>
      magicStoneReward > 0 ? Colors.lightGreen : Colors.red;
}

class GameEventsNotifier extends StateNotifier<List<GameEvent>> {
  GameEventsNotifier() : super([]);

  void push(GameEvent event) {
    if (state.length >= 50) {
      state = [...state.sublist(1), event];
    } else {
      state = [...state, event];
    }
  }
}

final gameEventsProvider =
    StateNotifierProvider<GameEventsNotifier, List<GameEvent>>(
        (ref) => GameEventsNotifier());
