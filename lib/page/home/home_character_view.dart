import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_inventory_view.dart';
import 'package:project_soaring/util/creature_extension.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class HomeCharacterView extends StatefulWidget {
  final Character character;
  final int score;
  final int firstCurrency;
  final int secondaryCurrency;
  final int thirdCurrency;
  final int fourthCurrency;
  final List<Item> items;
  final List<Item> equipments;
  final void Function(Item)? onPutOn;
  final void Function(Item)? onTakeOff;
  const HomeCharacterView({
    super.key,
    required this.character,
    this.score = 0,
    this.firstCurrency = 0,
    this.secondaryCurrency = 0,
    this.thirdCurrency = 0,
    this.fourthCurrency = 0,
    this.items = const <Item>[],
    this.equipments = const <Item>[],
    this.onPutOn,
    this.onTakeOff,
  });

  @override
  State<HomeCharacterView> createState() => _HomeCharacterViewState();
}

class _HomeCharacterViewState extends State<HomeCharacterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('角色')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Text(widget.character.name),
                      Text('【${widget.character.levelString}】'),
                      Spacer(),
                      Text('战力：${widget.score}'),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Text('极：${widget.fourthCurrency}'),
                      Text('上：${widget.thirdCurrency}'),
                      Text('中：${widget.secondaryCurrency}'),
                      Text('下：${widget.firstCurrency}'),
                    ],
                  ),
                ],
              ),
            ),
            _buildEquipments(),
            Expanded(
              child: HomeInventoryView(
                items: widget.items,
                onPutOn: widget.onPutOn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipments() {
    final placeholders = ['头', '身', '腿', '脚', '法宝', '法宝', '法宝', '法宝'];
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return ItemSlot(
            item: widget.equipments.elementAtOrNull(index),
            onTap: () => _openDialog(widget.equipments.elementAtOrNull(index)),
            placeholder: placeholders[index],
          );
        },
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  void _openDialog(Item? item) {
    if (item == null) return;
    var dialog = ItemDialog(
      item: item,
      actions: [
        PSButton(text: '卸下', onPressed: () => widget.onTakeOff?.call(item)),
      ],
    );
    DialogUtil.instance.show(dialog);
  }
}
