import 'package:flutter/material.dart';

class PSButton extends StatelessWidget {
  final bool? selected;
  final String text;
  final void Function()? onPressed;
  const PSButton({
    super.key,
    this.selected,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color:
              selected == true
                  ? Colors.black.withValues(alpha: 0.2)
                  : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(text),
      ),
    );
  }
}
