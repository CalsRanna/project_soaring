import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class ForgeInventoryView extends StatefulWidget {
  final List<Item> items;
  final void Function(Item)? onPutIn;
  const ForgeInventoryView({super.key, required this.items, this.onPutIn});

  @override
  State<ForgeInventoryView> createState() => _ForgeInventoryViewState();
}

class _ForgeInventoryViewState extends State<ForgeInventoryView> {
  int category = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 8,
          children: [
            PSButton(
              selected: category == 1,
              text: '材料',
              onPressed: () => updateCategory(1),
            ),
            PSButton(
              selected: category == 2,
              text: '装备',
              onPressed: () => updateCategory(2),
            ),
          ],
        ),
        Expanded(child: _buildGridView()),
      ],
    );
  }

  Widget _buildGridView() {
    var items = switch (category) {
      1 => widget.items.where((item) => item.type == 1).toList(),
      2 => widget.items.where((item) => item.type == 2).toList(),
      _ => widget.items,
    };
    items.sort((a, b) => b.rank.compareTo(a.rank));
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return ItemSlot(
          item: items[index],
          onTap:
              () => DialogUtil.instance.show(
                ItemDialog(
                  item: items[index],
                  actions: [
                    PSButton(
                      text: '放入',
                      onPressed: () => widget.onPutIn?.call(items[index]),
                    ),
                  ],
                ),
              ),
        );
      },
      itemCount: items.length,
    );
  }

  void updateCategory(int category) {
    this.category = category;
    setState(() {});
  }
}
