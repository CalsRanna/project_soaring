import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  static const pages = ['角色', '洞府', '战斗', '地宫', '试炼'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var page in pages)
          Transform.scale(
            scale: page == '战斗' ? 1.618 : 1,
            child: ToolbarTile(
              label: page,
              shape: page == '战斗' ? BoxShape.circle : BoxShape.rectangle,
              onTap: () => replace(context, page),
            ),
          ),
      ],
    );
  }

  void replace(BuildContext context, String page) {
    var _ = switch (page) {
      '角色' => const CharacterPageRoute().replace(context),
      '洞府' => const CharacterPageRoute().replace(context),
      '装备' => const EquipmentPageRoute().push(context),
      '背包' => const BackpackPageRoute().push(context),
      '地图' => const AreasPageRoute().push(context),
      '地宫' => const DungeonsPageRoute().push(context),
      '无尽试炼' => const TrialsPageRoute().push(context),
      _ => null,
    };
  }
}

class ToolbarTile extends StatefulWidget {
  const ToolbarTile({
    super.key,
    required this.label,
    this.shape = BoxShape.rectangle,
    this.onTap,
  });

  final String label;
  final BoxShape shape;
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
      child: SizedBox(
        height: 88,
        width: 88,
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: pi / 4,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    shape: widget.shape,
                  ),
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 48,
                ),
              ),
            ),
            Center(child: Text(widget.label))
          ],
        ),
      ),
    );
  }
}
