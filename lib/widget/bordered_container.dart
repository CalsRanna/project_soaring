import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    super.key,
    this.height,
    this.padding,
    this.width,
    this.child,
  });
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      height: height,
      padding: padding,
      width: width,
      child: child,
    );
  }
}
