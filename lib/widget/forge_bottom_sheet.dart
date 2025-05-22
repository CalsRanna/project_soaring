import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class ForgeBottomSheet extends StatelessWidget {
  final List<Item> items;
  final void Function(Item)? onPutIn;
  const ForgeBottomSheet({super.key, required this.items, this.onPutIn});

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => b.rank.compareTo(a.rank));
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return ItemSlot(item: items[index], onTap: () => openDialog(index));
      },
      itemCount: items.length,
      padding: const EdgeInsets.all(16.0),
    );
  }

  void openDialog(int index) {
    var itemDialog = ItemDialog(
      item: items[index],
      onPutIn: () => onPutIn?.call(items[index]),
    );
    DialogUtil.instance.show(itemDialog);
  }
}
