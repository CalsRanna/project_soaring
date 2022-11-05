import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Log {
  Log(this.message, {this.color = Colors.white}) : date = DateTime.now();

  final Color? color;
  final DateTime date;
  final String message;

  @override
  String toString() {
    return '你运转心法，获得$message点修为。';
  }
}

class LogsNotifier extends StateNotifier<List<Log>> {
  LogsNotifier() : super([]);

  void push(String message, {Color? color}) {
    if (state.length < 50) {
      state = [...state, Log(message, color: color)];
    } else {
      state = [...state.sublist(1), Log(message, color: color)];
    }
  }
}

final excerciseLogsProvider =
    StateNotifierProvider<LogsNotifier, List<Log>>((ref) => LogsNotifier());
