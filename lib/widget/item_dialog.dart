import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/item_extension.dart';
import 'package:project_soaring/util/modification_extension.dart';

class ItemDialog extends StatelessWidget {
  final Item item;
  final List<Widget>? actions;
  const ItemDialog({super.key, required this.item, this.actions});

  @override
  Widget build(BuildContext context) {
    var shape = BeveledRectangleBorder(side: BorderSide());
    return Dialog(shape: shape, child: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(item.name, style: TextStyle(color: item.color)),
        const SizedBox(height: 8),
        if (item.element > 0) Text('${Strings.element}${item.elementString}'),
        ..._buildModifications(),
        if (item.position > 0) Text(item.positionString),
        const SizedBox(height: 8),
        Text(item.description),
        if (actions != null) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: actions!,
          ),
        ],
      ],
    );
    return Padding(padding: const EdgeInsets.all(16), child: column);
  }

  List<Widget> _buildModifications() {
    return item.modifications.map((e) {
      return Text('${e.keyString}: ${e.value > 0 ? '+' : ''}${e.value}');
    }).toList();
  }
}
