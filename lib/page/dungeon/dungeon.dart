import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/equipment.dart';
import 'package:project_soaring/page/combat.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/util/dungeon.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/widget/Modal.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/message.dart';

class DungeonPage extends StatefulWidget {
  const DungeonPage({super.key});

  @override
  State<DungeonPage> createState() => _DungeonPageState();
}

class _DungeonPageState extends State<DungeonPage> {
  Dungeon dungeon = Dungeon();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceVariant = colorScheme.surfaceVariant;
    return Scaffold(
      appBar: AppBar(title: const Text('地下城')),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          GridView.builder(
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
                text = type.toString();
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

  @override
  void initState() {
    super.initState();
    dungeon = Generator().dungeon();
  }

  Future<void> handleTap(WidgetRef ref, int index) async {
    final manager = DungeonManager(dungeon);
    final reachable = manager.reachable(index);
    if (reachable) {
      final tile = dungeon.tiles[index];
      setState(() {
        tile.explored = true;
      });
      if (tile.type == 1) {
        return;
      }
      final notifier = ref.read(creatureNotifierProvider.notifier);
      await notifier.spawn();
      if (!mounted) return;
      const CombatPageRoute().push(context);
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
    setState(() {
      dungeon = Generator().dungeon();
    });
    Navigator.of(context).pop();
  }

  void moveOn() {
    Navigator.of(context).pop();
  }
}
