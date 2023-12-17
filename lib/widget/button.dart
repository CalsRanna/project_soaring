import 'package:flutter/material.dart';
import 'package:project_soaring/widget/container.dart';

class SoaringButton extends StatefulWidget {
  const SoaringButton({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<SoaringButton> createState() => _SoaringButtonState();
}

class _SoaringButtonState extends State<SoaringButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: SoaringContainer(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(widget.text),
      ),
    );
  }
}
