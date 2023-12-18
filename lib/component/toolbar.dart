import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/util/label.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var page in Labels.pages)
          ToolbarTile(label: page, onTap: () => replace(context, page)),
      ],
    );
  }

  void replace(BuildContext context, String page) {
    var _ = switch (page) {
      '角色' => const CharacterPageRoute().replace(context),
      '装备' => const EquipmentPageRoute().push(context),
      '背包' => const BackpackPageRoute().push(context),
      '装备重铸' => const RecastPageRoute().push(context),
      '地下城' => const DungeonPageRoute().push(context),
      _ => null,
    };
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
