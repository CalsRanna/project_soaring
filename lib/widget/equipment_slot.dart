import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/item_extension.dart';

class EquipmentSlot extends StatelessWidget {
  final Item? item;
  final String placeholder;
  const EquipmentSlot({super.key, this.item, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: _getColor())),
      child: Stack(
        children: [
          Center(
            child: Text(
              item?.name ?? placeholder,
              style: TextStyle(color: _getColor()),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    if (item == null) return Colors.black.withValues(alpha: 0.2);
    return item!.color;
  }
}
