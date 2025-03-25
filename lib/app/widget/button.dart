import 'package:flutter/material.dart';
import 'package:project_soaring/app/widget/container.dart';

class SoaringButton extends StatefulWidget {
  const SoaringButton({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<SoaringButton> createState() => _SoaringButtonState();
}

class _SoaringButtonState extends State<SoaringButton> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapCancel: handleTapCancel,
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: scale,
        child: SoaringContainer(
          borderRadius: BorderRadius.circular(4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(widget.text),
        ),
      ),
    );
  }

  void handleTapCancel() {
    setState(() {
      scale = 1;
    });
  }

  void handleTapDown(TapDownDetails details) {
    setState(() {
      scale = 0.9;
    });
  }

  void handleTapUp(TapUpDetails details) {
    setState(() {
      scale = 1;
    });
  }
}
