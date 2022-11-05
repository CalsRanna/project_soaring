import 'package:flutter/material.dart';

class GameContainer extends StatelessWidget {
  const GameContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
