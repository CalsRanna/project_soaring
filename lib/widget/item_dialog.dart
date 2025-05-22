import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/item_extension.dart';

class ItemDialog extends StatelessWidget {
  final Item item;
  const ItemDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(),
    );
    return Dialog(shape: shape, child: _buildContent(context));
  }

  Widget _buildCancelButton(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text('取消'),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: container,
    );
  }

  Widget _buildContent(BuildContext context) {
    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [_buildCancelButton(context)],
    );
    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(item.name, style: TextStyle(color: item.color)),
        const SizedBox(height: 8),
        Text('属性：${item.elementString}'),
        if (item.position > 0) Text(item.positionString),
        if (item.description.isNotEmpty)
          Text('“${item.description}”', style: TextStyle(fontSize: 10)),
        const SizedBox(height: 16),
        buttons,
      ],
    );
    return Padding(padding: const EdgeInsets.all(16), child: body);
  }
}
