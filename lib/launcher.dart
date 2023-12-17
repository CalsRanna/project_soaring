import 'package:flutter/material.dart';
import 'package:project_soaring/character.dart';
import 'package:project_soaring/widget/bordered_container.dart';

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
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: startGame,
              child: const BorderedContainer(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text('开始游戏'),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: startGame,
              child: const BorderedContainer(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text('继续游戏'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void startGame() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CharacterPage(),
      ),
    );
  }
}
