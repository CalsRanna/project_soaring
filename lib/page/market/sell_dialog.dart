import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class SellDialog extends StatelessWidget {
  final String title;
  final List<Item> currency;
  const SellDialog({super.key, required this.title, required this.currency});

  @override
  Widget build(BuildContext context) {
    var shape = BeveledRectangleBorder(side: BorderSide());
    return Dialog(shape: shape, child: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 8),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return ItemSlot(
                item: currency[index],
                onTap:
                    () => DialogUtil.instance.show(
                      ItemDialog(item: currency[index]),
                    ),
              );
            },
            itemCount: currency.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
