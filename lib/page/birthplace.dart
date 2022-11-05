import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/dispatcher/archive_dispatcher.dart';
import 'package:project_soaring/page/archives.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/util/game_generator.dart';
import 'package:project_soaring/widget/game_app.dart';
import 'package:project_soaring/widget/game_button.dart';

class Birthplace extends HookConsumerWidget {
  const Birthplace({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var archive = ref.watch(currentArchiveProvider);

    return GameApp(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _randomName(ref),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(archive),
              ),
            ),
            const SizedBox(height: 8),
            GameButton(
              size: GameButtonSize.large,
              onTap: () => _simulate(context, ref),
              child: const Text('开启人生'),
            ),
            const SizedBox(height: 8),
            GameButton(
              size: GameButtonSize.large,
              onTap: () => _pop(context, ref),
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }

  void _randomName(WidgetRef ref) {
    ref.read(currentArchiveProvider.state).state = GameGenerator.name();
  }

  void _simulate(BuildContext context, WidgetRef ref) {
    var archive = ref.watch(currentArchiveProvider);
    var index = ref.watch(currentArchiveIndexProvider);

    var box = Hive.box<String>('archive');

    box.put('archive$index', archive);
    ref.read(characterProvider.notifier).init(Character.random(name: archive));

    context.go('/home');
  }

  void _pop(BuildContext context, WidgetRef ref) {
    context.go('/archives');
  }
}
