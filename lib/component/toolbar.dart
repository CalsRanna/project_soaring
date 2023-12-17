import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/backpack.dart';
import 'package:project_soaring/character.dart';
import 'package:project_soaring/equipment.dart';
import 'package:project_soaring/main.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/recast.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ToolbarTile(
          label: '角色',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CharacterPage(),
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) => ToolbarTile(
            label: '装备',
            onTap: () async {
              final notifier =
                  ref.read(availableEquipmentsNotifierProvider.notifier);
              await notifier.mock();
              if (!context.mounted) return;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EquipmentPage(),
                ),
              );
            },
          ),
        ),
        ToolbarTile(
          label: '背包',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BackpackPage(),
              ),
            );
          },
        ),
        ToolbarTile(label: '战斗', onTap: () {}),
        ToolbarTile(label: '任务', onTap: () {}),
        ToolbarTile(label: '地图', onTap: () {}),
        ToolbarTile(label: '成就', onTap: () {}),
        ToolbarTile(
          label: '装备重铸',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RecastPage(),
              ),
            );
          },
        ),
        ToolbarTile(label: '设置', onTap: () {}),
      ],
    );
  }
}
