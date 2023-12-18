import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/widget/container.dart';

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
            Consumer(
              builder: (context, ref, child) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => startGame(ref),
                child: const SoaringContainer(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text('开始游戏'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> startGame(WidgetRef ref) async {
    final character = await ref.read(characterNotifierProvider.future);
    if (!mounted) return;
    if (character.name.isEmpty) {
      const SpawnPageRoute().replace(context);
    } else {
      const CharacterPageRoute().replace(context);
    }
  }
}
