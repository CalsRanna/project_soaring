import 'dart:math';

import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/exercise/exercise_result.dart';
import 'package:project_soaring/util/string_extension.dart';

class ExerciseController {
  int performance = 5;
  ExerciseResult exercise() {
    var averagePerformance = (performance / 2).ceil();
    var random = Random.secure();
    var experience = random.nextInt(averagePerformance) + averagePerformance;
    return ExerciseResult()
      ..experience = experience
      ..log = Strings.exerciseSuccess.format([experience]);
  }
}
