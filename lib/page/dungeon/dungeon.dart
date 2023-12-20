import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/equipment.dart';
import 'package:project_soaring/page/combat.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/provider/dungeon.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/util/dungeon.dart';
import 'package:project_soaring/util/generator.dart';
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
      appBar: AppBar(title: const Text('地下城')),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          ConstrainedBox(
            constraints: constraints,
            child: Consumer(builder: (context, ref, child) {
              final provider = ref.watch(dungeonProvider(widget.id));
              Dungeon? dungeon = switch (provider) {
                AsyncData(:final value) => value,
                _ => null,
              };
              if (dungeon == null) return const SizedBox();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final type = dungeon.tiles[index].type;
                  if (type == 0) return const SizedBox();
                  final explored = dungeon.tiles[index].explored;
                  var text = '';
                  if (explored && type != 1) {
                    text = Labels.tileTypes[type];
                  }
                  return Consumer(
                    builder: (context, ref, child) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => handleTap(ref, index),
                      child: Container(
                        color: surfaceVariant.withOpacity(explored ? 0.25 : 1),
                        child: Center(child: Text(text)),
                      ),
                    ),
                  );
                },
                itemCount: dungeon.tiles.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              );
            }),
          ),
          Expanded(child: Consumer(builder: (context, ref, child) {
            final provider = ref.watch(lootEquipmentsNotifierProvider);
            List<Equipment> equipments = switch (provider) {
              AsyncData(:final value) => value,
              _ => [],
            };
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) => EquipmentTile(
                equipment: equipments[index],
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
    final dungeonNotifier = ref.read(dungeonsNotifierProvider.notifier);
    if (dungeon == null) return;
    final manager = DungeonManager(dungeon);
    final reachable = manager.reachable(index);
    if (reachable) {
      final tile = dungeon.tiles[index];
      if (tile.type == 1) {
        return;
      }
      if (tile.type == 2) {
        final notifier = ref.read(creatureNotifierProvider.notifier);
        await notifier.spawn();
        if (!mounted) return;
        const CombatPageRoute().push(context);
      }
      if (tile.type == 3) {
        final notifier = ref.read(dungeonsNotifierProvider.notifier);
        final event = await notifier.triggerEvent();
        if (event == null) return;
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
      dungeonNotifier.exploreTile(widget.id, index);
      // Modal.of(context).show(
      //   child: CombatPage(
      //     character: character,
      //     creature: creature,
      //     stats: stats,
      //   ),
      // );
      // setState(() {
      //   tile.explored = true;
      // });
      // if (tile.type == 2) {
      //   final notifier = ref.read(lootEquipmentsNotifierProvider.notifier);
      //   await notifier.loot();
      // }
      // if (!mounted) return;
      // if (tile.type == 5) {
      //   Modal.of(context).show(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           'GOTCHA',
      //           style: Theme.of(context).textTheme.titleLarge,
      //         ),
      //         const SizedBox(height: 32),
      //         Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             SoaringButton(text: 'RESTART', onTap: restart),
      //             const SizedBox(width: 16),
      //             SoaringButton(text: 'CONTINUE', onTap: moveOn),
      //           ],
      //         )
      //       ],
      //     ),
      //   );
      // }
    } else {
      Message.of(context).show('NOT REACHABLE');
    }
  }

  void restart() {
    Navigator.of(context).pop();
  }

  void moveOn() {
    Navigator.of(context).pop();
  }
}
