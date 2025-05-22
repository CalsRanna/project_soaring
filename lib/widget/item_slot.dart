import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/item_extension.dart';

class ItemSlot extends StatelessWidget {
  final Item? item;
  final void Function()? onTap;
  final String? placeholder;
  const ItemSlot({super.key, this.item, this.onTap, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: _getColor())),
        padding: EdgeInsets.all(4),
        child: item == null ? _buildSlot() : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Center(
          child: Text(
            item!.name,
            style: TextStyle(color: _getColor()),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Text(item!.count.toString(), style: TextStyle(fontSize: 8)),
        ),
      ],
    );
  }

  Widget _buildSlot() {
    return Stack(
      children: [
        Center(
          child: Text(
            item?.name ?? placeholder ?? '',
            style: TextStyle(color: _getColor()),
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    if (item == null) return Colors.black.withValues(alpha: 0.2);
    return item!.color;
  }
}
