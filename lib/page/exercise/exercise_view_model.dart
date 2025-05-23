import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/exercise/exercise_controller.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:signals/signals.dart';

class ExerciseViewModel {
  final experience = signal(0);
  final logs = signal(<String>[]);

  late final Timer _timer;
  final scrollController = ScrollController();

  void dispose() {
    scrollController.dispose();
  }

  void start() {
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    if (homeViewModel.isExercising.value) {
      stop();
      return;
    }
    homeViewModel.updateIsExercising(true);
    logs.value = [Strings.exerciseProgress];
    var exerciseController = ExerciseController();
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      var result = exerciseController.exercise();
      homeViewModel.increaseExperience(result.experience);
      logs.value = [...logs.value, result.log];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void stop() {
    _timer.cancel();
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    homeViewModel.updateIsExercising(false);
  }
}
