import 'package:flutter/material.dart';
import 'package:project_soaring/widget/decoration_block.dart';

final List<String> functions = ['洞府', '背包', '坊市', '历练', '宗门'];

class FunctionBar extends StatefulWidget {
  const FunctionBar({Key? key, required this.active, this.onTap})
      : super(key: key);

  final int active;
  final void Function(int)? onTap;

  @override
  State<FunctionBar> createState() => _FunctionBarState();
}

class _FunctionBarState extends State<FunctionBar> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < functions.length; i++) {
      if (widget.active == i) {
        children.add(Row(
          children: [
            const DecorationBlock(),
            const SizedBox(width: 8),
            Text(functions[i]),
            const SizedBox(width: 8),
            const DecorationBlock(),
          ],
        ));
      } else {
        children.add(GestureDetector(
          onTap: () => _handleTap(i),
          child: Text(functions[i]),
        ));
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }

  void _handleTap(int index) {
    widget.onTap?.call(index);
  }
}
