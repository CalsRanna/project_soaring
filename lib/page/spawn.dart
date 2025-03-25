import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/util/generator.dart';

@RoutePage()
class SpawnPage extends StatefulWidget {
  const SpawnPage({super.key});

  @override
  State<SpawnPage> createState() => _SpawnPageState();
}

class _SpawnPageState extends State<SpawnPage> {
  String name = '路人甲';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('请选择你的名字。'),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: randomName,
              child: Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 4),
                width: 96,
                child: Text(name),
              ),
            ),
            // Consumer(
            //   builder: (context, ref, child) {
            //     return SoaringButton(text: '进入游戏', onTap: () => enterGame(ref));
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  void randomName() {
    final generator = Generator();
    setState(() {
      name = generator.name();
    });
  }

  // Future<void> enterGame(WidgetRef ref) async {
  //   final notifier = ref.read(characterNotifierProvider.notifier);
  //   await notifier.create(name);
  //   final areaNotifier = ref.read(areasNotifierProvider.notifier);
  //   await areaNotifier.generate();
  //   if (!mounted) return;
  //   const CharacterPageRoute().replace(context);
  // }
}
