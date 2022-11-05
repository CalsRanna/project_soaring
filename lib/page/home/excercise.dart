import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/page/game.dart';
import 'package:project_soaring/page/home/component/character_stats.dart';
import 'package:project_soaring/page/home/component/left_bar.dart';
import 'package:project_soaring/page/home/component/exercise_particular.dart';

final hasOfflineExperienceProvider = StateProvider((ref) => false);
final offlineSecondsProvider = StateProvider((ref) => 0);

class ExcercisePage extends HookConsumerWidget {
  const ExcercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Game(children: [
      const CharacterStats(),
      const SizedBox(height: 8),
      Expanded(
        child: Row(
          children: const [
            HomeLeftbar(active: 0),
            SizedBox(width: 8),
            Expanded(child: ExerciseParticular()),
          ],
        ),
      ),
    ]);
  }
}
