import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/item_tile.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/dungeon.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/dungeon.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/modal.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/message.dart';

class DungeonPage extends StatefulWidget {
  const DungeonPage({super.key, required this.id});

  final int id;

  @override
  State<DungeonPage> createState() => _DungeonPageState();
}

class _DungeonPageState extends State<DungeonPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceVariant = colorScheme.surfaceVariant;
    final media = MediaQuery.of(context);
    final size = media.size;
    final constraints = BoxConstraints(
      maxHeight: size.height / 2,
      maxWidth: size.height / 2,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('地宫')),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          ConstrainedBox(
            constraints: constraints,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Consumer(
                  builder: (context, ref, child) {
                    final provider = ref.watch(
                      tileNotifierProvider(dungeonId: widget.id, index: index),
                    );
                    final tile = switch (provider) {
                      AsyncData(:final value) => value,
                      _ => null,
                    };
                    if (tile == null) return const SizedBox();
                    final type = tile.type;
                    if (type == 0) return const SizedBox();
                    final explored = tile.explored;
                    var text = '';
                    if (explored && type != 1) {
                      text = Labels.tileTypes[type];
                    }
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => handleTap(ref, index),
                      child: Container(
                        color: surfaceVariant.withOpacity(explored ? 0.25 : 1),
                        child: Center(child: Text(text)),
                      ),
                    );
                  },
                );
              },
              itemCount: 100,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ),
          Expanded(child: Consumer(builder: (context, ref, child) {
            final provider = ref.watch(lootEquipmentsNotifierProvider);
            List<Item> equipments = switch (provider) {
              AsyncData(:final value) => value,
              _ => [],
            };
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) => ItemTile(
                item: equipments[index],
              ),
              itemCount: equipments.length,
            );
          })),
        ],
      ),
    );
  }

  Future<void> handleTap(WidgetRef ref, int index) async {
    final dungeon = await ref.read(dungeonProvider(widget.id).future);
    final tile = await ref.read(
      tileNotifierProvider(dungeonId: widget.id, index: index).future,
    );
    if (dungeon == null || tile == null) return;
    final manager = DungeonManager(dungeon);
    final reachable = manager.reachable(index);
    if (!reachable) {
      if (!mounted) return;
      Message.of(context).show('NOT REACHABLE');
      return;
    }
    final tileNotifier = ref.read(
      tileNotifierProvider(dungeonId: widget.id, index: index).notifier,
    );
    if (tile.type == 1 || tile.type == 4 || tile.type == 5) {
      tileNotifier.explore();
    }
    if (tile.type == 2) {
      final creatures = await tileNotifier.creatures();
      if (!mounted) return;
      final names = creatures.map((creature) => '「${creature.name}」').join('，');
      Modal.of(context).show(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('遭遇战斗'),
            Text('「$names」'),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SoaringButton(text: '进入战斗', onTap: enterCombat),
                const SizedBox(width: 8),
                SoaringButton(text: '暂时离开', onTap: leaveCombat),
              ],
            ),
          ],
        ),
      );
      // const CombatPageRoute().push(context);
    }
    if (tile.type == 3) {
      final event = await tileNotifier.event();
      Widget reward = const SizedBox();
      switch (event.reward) {
        case 0:
          break;
        case 1:
          final characterNotifier =
              ref.read(characterNotifierProvider.notifier);
          final difficulty = tile.difficulty + 1;
          final experience = Random().nextInt(difficulty * 100);
          await characterNotifier.updateExperience(experience);
          reward = Text('获得「$experience」点经验值');
          break;
        case 2:
          final characterNotifier =
              ref.read(characterNotifierProvider.notifier);
          final difficulty = tile.difficulty + 1;
          final gold = Random().nextInt(difficulty * 100);
          await characterNotifier.updateGold(gold);
          reward = Text('获得「$gold」金币');
          break;
        case 3:
          break;
        case 4:
          break;
        default:
          break;
      }
      if (!mounted) return;
      Modal.of(context).show(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(event.content), reward],
        ),
      );
    }
  }

  void enterCombat() {
    Navigator.of(context).pop();
    const CombatPageRoute().push(context);
  }

  void leaveCombat() {
    Navigator.of(context).pop();
  }
}
