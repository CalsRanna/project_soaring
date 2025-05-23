import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_inventory_view.dart';
import 'package:project_soaring/util/creature_extension.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/util/item_extension.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/item_dialog.dart';
import 'package:project_soaring/widget/item_slot.dart';

class HomeCharacterView extends StatefulWidget {
  final Character character;
  final int score;
  final int firstCurrency;
  final int secondCurrency;
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
    this.secondCurrency = 0,
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
    var children = [
      _buildOverview(),
      _buildEquipments(),
      Expanded(
        child: HomeInventoryView(items: widget.items, onPutOn: widget.onPutOn),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.creature)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(spacing: 16, children: children),
      ),
    );
  }

  Widget _buildOverview() {
    var score = Row(
      spacing: 8,
      children: [
        Text(widget.character.name),
        Text(widget.character.levelString),
        Spacer(),
        Text('${Strings.score}${widget.score}'),
      ],
    );
    var currency = Row(
      spacing: 8,
      children: [
        Text('${Strings.fourthCurrency}${widget.fourthCurrency}'),
        Text('${Strings.thirdCurrency}${widget.thirdCurrency}'),
        Text('${Strings.secondCurrency}${widget.secondCurrency}'),
        Text('${Strings.firstCurrency}${widget.firstCurrency}'),
      ],
    );
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(children: [score, currency]),
    );
  }

  Widget _buildEquipments() {
    var delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: GridView.builder(
        gridDelegate: delegate,
        itemBuilder: (context, index) => _buildEquipmentItem(index),
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildEquipmentItem(int index) {
    var item =
        widget.equipments
            .where((i) => i.positionString == Strings.placeholders[index])
            .firstOrNull;
    return ItemSlot(
      item: item,
      onTap: () => _openDialog(item),
      placeholder: Strings.placeholders[index],
    );
  }

  void _openDialog(Item? item) {
    if (item == null) return;
    var takeOffButton = PSButton(
      text: Strings.takeOff,
      onPressed: () => widget.onTakeOff?.call(item),
    );
    var dialog = ItemDialog(item: item, actions: [takeOffButton]);
    DialogUtil.instance.show(dialog);
  }
}
