import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/dungeon.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/container.dart';

class DungeonsPage extends StatefulWidget {
  const DungeonsPage({super.key});

  @override
  State<DungeonsPage> createState() => _DungeonsPageState();
}

class _DungeonsPageState extends State<DungeonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('地下城列表')),
      body: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(dungeonsNotifierProvider);
        List<Dungeon> dungeons = switch (provider) {
          AsyncData(:final value) => value,
          _ => [],
        };
        return ListView.separated(
          itemBuilder: (context, index) {
            return _DungeonTile(
              dungeon: dungeons[index],
              onTap: () => handleTap(ref, dungeons[index].id),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: dungeons.length,
        );
      }),
    );
  }

  void handleTap(WidgetRef ref, int id) async {
    final notifier = ref.read(dungeonsNotifierProvider.notifier);
    await notifier.rogueLiteTiles(id);
    if (!mounted) return;
    DungeonPageRoute(id: id).push(context);
  }
}

class _DungeonTile extends StatelessWidget {
  const _DungeonTile({required this.dungeon, this.onTap});

  final Dungeon dungeon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final color = Labels.difficultyColors[dungeon.difficulty];
    final difficulty = Labels.difficultyTexts[dungeon.difficulty];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SoaringContainer(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 96,
              child: Center(
                child: Text(difficulty, style: TextStyle(color: color)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(dungeon.name), Text(dungeon.story)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
