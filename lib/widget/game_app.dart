import 'package:flutter/material.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTextStyle.merge(
          child: child,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
