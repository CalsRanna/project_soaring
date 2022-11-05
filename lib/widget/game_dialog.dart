import 'package:flutter/material.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({Key? key, required this.child, this.tip = true})
      : super(key: key);

  final Widget child;
  final bool tip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.black,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Material(
              color: Colors.black,
              child: DefaultTextStyle.merge(
                style: const TextStyle(color: Colors.white),
                child: child,
              ),
            ),
          ),
          if (tip) const SizedBox(height: 8),
          if (tip)
            const Text(
              '点击空白处关闭',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            )
        ],
      ),
    );
  }
}
