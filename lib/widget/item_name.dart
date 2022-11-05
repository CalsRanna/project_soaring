import 'package:flutter/material.dart';
import 'package:project_soaring/provider/items_provider.dart';

class ItemName extends StatelessWidget {
  const ItemName({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Text(item.name, style: TextStyle(color: item.qualityColor));
  }
}
