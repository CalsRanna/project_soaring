import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/forge/forge_inventory_view.dart';

class ForgeBottomSheet extends StatelessWidget {
  final List<Item> items;
  final void Function(Item)? onPutIn;
  const ForgeBottomSheet({super.key, required this.items, this.onPutIn});

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => b.rank.compareTo(a.rank));
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ForgeInventoryView(items: items, onPutIn: onPutIn),
    );
  }
}
