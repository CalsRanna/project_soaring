import 'package:flutter/material.dart';
import 'package:project_soaring/app/widget/container.dart';

class SoaringTab extends StatelessWidget {
  const SoaringTab({
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceContainerHighest = colorScheme.surfaceContainerHighest;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SoaringContainer(
        color: active ? surfaceContainerHighest : null,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(label),
      ),
    );
  }
}
