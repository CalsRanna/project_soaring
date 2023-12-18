import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/backpack.dart';
import 'package:project_soaring/character.dart';
import 'package:project_soaring/equipment.dart';
import 'package:project_soaring/page/dungeon/dungeon.dart';
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
                  ref.read(availableEquipmentsNotifierProvider(null).notifier);
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
        ToolbarTile(
          label: '地下城',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DungeonPage(),
              ),
            );
          },
        ),
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

class ToolbarTile extends StatefulWidget {
  const ToolbarTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  State<ToolbarTile> createState() => _ToolbarTileState();
}

class _ToolbarTileState extends State<ToolbarTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: 72,
        child: Text(widget.label),
      ),
    );
  }
}
