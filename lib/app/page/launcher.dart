import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/app/router/router.gr.dart';
import 'package:project_soaring/app/widget/button.dart';

@RoutePage()
class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PROJECT SOARING',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            SoaringButton(onTap: continueGame, text: 'Continue Game'),
            const SizedBox(height: 16),
            SoaringButton(onTap: startGame, text: 'Start Game'),
          ],
        ),
      ),
    );
  }

  void continueGame() {}

  Future<void> startGame() async {
    // final character = await ref.read(characterNotifierProvider.future);
    // final creature = character?.creature.value;
    // if (!mounted) return;
    // if (creature == null || creature.name.isEmpty) {
    //   const SpawnPageRoute().replace(context);
    // } else {
    //   const CharacterPageRoute().replace(context);
    // }
    SpawnRoute().push(context);
  }
}
