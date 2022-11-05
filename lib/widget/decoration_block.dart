import 'dart:math';

import 'package:flutter/material.dart';

class DecorationBlock extends StatelessWidget {
  const DecorationBlock({Key? key, this.block = true, this.size = 8})
      : super(key: key);

  final bool block;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: block ? Colors.white : null,
        ),
        height: size,
        width: size,
      ),
    );
  }
}
