import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/page/game.dart';
import 'package:project_soaring/page/home/component/character_stats.dart';
import 'package:project_soaring/page/sect/component/left_bar.dart';

class SectPage extends HookConsumerWidget {
  const SectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Game(children: [
      const CharacterStats(),
      const SizedBox(height: 8),
      Expanded(
        child: Row(
          children: const [
            SectLeftBar(active: 0),
            SizedBox(width: 8),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    ]);
  }
}
