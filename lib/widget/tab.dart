import 'package:flutter/material.dart';
import 'package:project_soaring/widget/bordered_container.dart';

class TabTile extends StatelessWidget {
  const TabTile({
    super.key,
    this.active = false,
    required this.label,
    required this.onTap,
  });

  final bool active;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: BorderedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(label),
      ),
    );
  }
}
