import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/archives_provider.dart';
import 'package:project_soaring/widget/game_app.dart';
import 'package:project_soaring/widget/game_button.dart';

class Start extends HookConsumerWidget {
  const Start({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameApp(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '飞升计划',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            GameButton(
              size: GameButtonSize.large,
              onTap: () => _startGame(context, ref),
              child: const Text('开始游戏'),
            ),
          ],
        ),
      ),
    );
  }

  void _startGame(BuildContext context, WidgetRef ref) {
    var box = Hive.box<String>('archive');
    var archives = [
      box.get('archive0'),
      box.get('archive1'),
      box.get('archive2'),
    ];
    ref.read(archivesProvider.notifier).init(archives);
    context.go('/archives');
  }
}
