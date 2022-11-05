import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/page/home/component/exercise_particular.dart';
import 'package:project_soaring/widget/game_app.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_dialog.dart';
import 'package:project_soaring/widget/spell_name.dart';

Timer? timer2;

class YouAreDead extends HookConsumerWidget {
  const YouAreDead({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameApp(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('大丈夫何患无妻，请大侠重新来过。'),
            const SizedBox(height: 8),
            GameButton(
              onTap: () => _showBiography(context, ref),
              child: const Text('查看生平'),
            ),
            const SizedBox(height: 8),
            GameButton(
              onTap: () => _startOver(context, ref),
              child: const Text('重新开始'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBiography(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => GameDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(character.name),
            Text('${character.age}/${character.lifetime}'),
            SpellName(spell: character.spell),
            Text(character.experienceString),
            Text('${character.birthdayString}，你出生了。'),
            const Text('你死了。'),
          ],
        ),
      ),
    );
  }

  void _startOver(BuildContext context, WidgetRef ref) {
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();

    context.go('/');
  }
}
