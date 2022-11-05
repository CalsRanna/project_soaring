import 'package:flutter/material.dart';

class GameButton extends StatefulWidget {
  const GameButton({
    Key? key,
    this.color = Colors.white,
    this.disabled = false,
    this.size = GameButtonSize.medium,
    this.onTap,
    required this.child,
  }) : super(key: key);

  final Color color;
  final bool disabled;
  final GameButtonSize size;
  final void Function()? onTap;
  final Widget child;

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var horizontal = 8.0;
    var verical = 4.0;
    if (widget.size == GameButtonSize.large) {
      horizontal = 12;
      verical = 8;
    } else if (widget.size == GameButtonSize.small) {
      horizontal = 4;
      verical = 0;
    }
    return GestureDetector(
      onLongPressUp: () => setState(() => isClicked = false),
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: widget.color),
          color: isClicked || widget.disabled ? Colors.white30 : Colors.black,
          shape: BoxShape.rectangle,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: verical),
        child: widget.child,
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.disabled) {
      setState(() => isClicked = true);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.disabled) {
      setState(() => isClicked = false);
      widget.onTap?.call();
    }
  }
}

enum GameButtonSize { large, medium, small }
