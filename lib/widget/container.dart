import 'package:flutter/material.dart';

class SoaringContainer extends StatelessWidget {
  const SoaringContainer({
    super.key,
    this.borderRadius,
    this.color,
    this.height,
    this.padding,
    this.width,
    this.child,
  });
  final BorderRadius? borderRadius;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onSurface = colorScheme.onSurface;
    final border = Border.all(color: onSurface);
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        color: color,
      ),
      height: height,
      padding: padding,
      width: width,
      child: child,
    );
  }
}
