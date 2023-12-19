import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/area.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/container.dart';

class AreasPage extends StatefulWidget {
  const AreasPage({super.key});

  @override
  State<AreasPage> createState() => _AreasPageState();
}

class _AreasPageState extends State<AreasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('地图列表')),
      body: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(areasNotifierProvider);
        List<Area> areas = switch (provider) {
          AsyncData(:final value) => value,
          _ => [],
        };
        final characterNotifier = ref.watch(characterNotifierProvider);
        Character? character = switch (characterNotifier) {
          AsyncData(:final value) => value,
          _ => null,
        };
        return ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => handleTap(ref, areas[index]),
            child: SoaringContainer(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('「${areas[index].name}」'),
                            const SizedBox(width: 8),
                            Text('适合等级：${areas[index].level}'),
                            const SizedBox(width: 8),
                            if (character != null)
                              Builder(builder: (context) {
                                final level = character.level;
                                final difficulty =
                                    calculateDifficulty(areas[index], level);
                                final text = Labels.difficultyTexts[difficulty];
                                final color =
                                    Labels.difficultyColors[difficulty];
                                return Text(text,
                                    style: TextStyle(color: color));
                              })
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(areas[index].description),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 128,
                    child: Builder(builder: (context) {
                      return Center(child: Builder(builder: (context) {
                        if (character == null) return const SizedBox();
                        final level = character.level;
                        final available =
                            calculateAvailable(areas[index], level);
                        var text = '';
                        Color? color;
                        if (areas[index].stationed) {
                          text = '驻扎中';
                        } else {
                          text = available ? '' : '不可用';
                          color = Theme.of(context).colorScheme.surfaceVariant;
                        }
                        return Text(text, style: TextStyle(color: color));
                      }));
                    }),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: areas.length,
        );
      }),
    );
  }

  Future<void> handleTap(WidgetRef ref, Area area) async {
    final character = await ref.read(characterNotifierProvider.future);
    final available = calculateAvailable(area, character.level);
    if (available) {
      final notifier = ref.read(areasNotifierProvider.notifier);
      notifier.station(area);
    }
  }

  bool calculateAvailable(Area area, int level) {
    return area.level - level <= 2;
  }

  int calculateDifficulty(Area area, int level) {
    int difficulty = 0;
    if (area.level >= level) {
      final difference = area.level - level;
      if (difference >= 0) {
        difficulty = 1;
      }
      if (difference >= 10) {
        difficulty = 2;
      }
      if (difference >= 20) {
        difficulty = 3;
      }
    }
    return difficulty;
  }
}
