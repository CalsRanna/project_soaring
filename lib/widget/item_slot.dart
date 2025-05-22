import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/util/item_extension.dart';
import 'package:project_soaring/widget/item_dialog.dart';

class ItemSlot extends StatelessWidget {
  final Item item;
  const ItemSlot({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => DialogUtil.instance.show(ItemDialog(item: item)),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: item.color)),
        padding: EdgeInsets.all(4),
        child: Stack(
          children: [
            Center(
              child: Text(
                item.name,
                style: TextStyle(color: item.color),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(item.count.toString(), style: TextStyle(fontSize: 8)),
            ),
          ],
        ),
      ),
    );
  }
}
