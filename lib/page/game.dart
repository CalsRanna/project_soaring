import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/dispatcher/excercise_dispatcher.dart';
import 'package:project_soaring/page/home/component/exercise_particular.dart';
import 'package:project_soaring/page/you_are_dead.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/widget/function_bar.dart';
import 'package:project_soaring/widget/game_app.dart';
import 'package:project_soaring/widget/information_bar.dart';

final activePageProvider = StateProvider((ref) => 0);

class Game extends HookConsumerWidget {
  const Game({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);
    var active = ref.watch(activePageProvider);

    return character.isDead
        ? const YouAreDead()
        : GameApp(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  InformationBar(character: character),
                  const SizedBox(height: 8),
                  ...children,
                  const SizedBox(height: 8),
                  FunctionBar(
                      onTap: (index) => _navigate(context, ref, index),
                      active: active),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
  }

  void _navigate(BuildContext context, WidgetRef ref, int index) {
    ref.read(activePageProvider.state).state = index;

    ref.read(isExcercisingProvider.state).state = false;
    ExcerciseDispatcher.stop();

    var routes = ['home', 'bag', 'market', 'adventure', 'sect'];
    context.go('/${routes[index]}');
  }
}
