import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class HomeInventoryView extends StatefulWidget {
  final List<Item> items;
  final void Function(Item)? onPutOn;
  const HomeInventoryView({super.key, required this.items, this.onPutOn});

  @override
  State<HomeInventoryView> createState() => _HomeInventoryViewState();
}

class _HomeInventoryViewState extends State<HomeInventoryView> {
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
              text: Strings.material,
              onPressed: () => updateCategory(1),
            ),
            PSButton(
              selected: category == 2,
              text: Strings.equipment,
              onPressed: () => updateCategory(2),
            ),
            PSButton(
              selected: category == 3,
              text: Strings.elixir,
              onPressed: () => updateCategory(3),
            ),
          ],
        ),
        Expanded(child: _buildGridView()),
      ],
    );
  }

  Widget _buildGridView() {
    var items = switch (category) {
      1 =>
        widget.items
            .where(
              (item) => item.type == 1 && !item.name.contains(Strings.currency),
            )
            .toList(),
      2 => widget.items.where((item) => item.type == 2).toList(),
      3 => widget.items.where((item) => item.type == 3).toList(),
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
                    if (category == 2)
                      PSButton(
                        text: Strings.putOn,
                        onPressed: () => widget.onPutOn?.call(items[index]),
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
