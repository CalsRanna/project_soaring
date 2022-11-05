import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/page/bag/component/left_bar.dart';
import 'package:project_soaring/page/game.dart';
import 'package:project_soaring/page/home/component/character_stats.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/provider/items_provider.dart';
import 'package:project_soaring/util/game_generator.dart';
import 'package:project_soaring/widget/decoration_block.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_container.dart';
import 'package:project_soaring/widget/game_dialog.dart';
import 'package:project_soaring/widget/item_name.dart';

class ItemPage extends HookConsumerWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var items = ref.watch(itemsProvider);

    var children = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      children.add(_EquipmentButton(item: items[i]));
    }

    return Game(children: [
      const CharacterStats(),
      const SizedBox(height: 8),
      Expanded(
        child: Row(
          children: [
            const BagLeftBar(active: 0),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GameContainer(
                      child: GridView.count(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: children,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GameButton(
                    onTap: () => _randomItems(ref),
                    child: Text('随机添加道具'),
                  ),
                  const SizedBox(height: 8),
                  const GameContainer(
                    child: SizedBox(
                      height: 64,
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  void _randomItems(WidgetRef ref) {
    Item item = GameGenerator.item(category: 0);
    ref.read(itemsProvider.notifier).addItem(item);
  }
}

class _EquipmentButton extends HookConsumerWidget {
  const _EquipmentButton({Key? key, required this.item}) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameButton(
      color: item.qualityColor,
      onTap: () => _openEquipmentCard(context, item),
      child: Column(
        children: [
          ItemName(item: item),
          if (item.attributes.isNotEmpty) Text('${item.attributes[0]}'),
        ],
      ),
    );
  }

  void _openEquipmentCard(BuildContext context, Item item) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => _EquipmentCard(item: item),
    );
  }
}

class _EquipmentCard extends HookConsumerWidget {
  const _EquipmentCard({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget line = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.white],
        ),
      ),
      height: 1,
      width: 80,
    );

    var decoration = const DecorationBlock(block: false);

    Widget rightLine = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.white, Colors.transparent],
        ),
      ),
      height: 1,
      width: 80,
    );

    var title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line,
        decoration,
        const SizedBox(width: 16),
        const Text('装备信息'),
        const SizedBox(width: 16),
        decoration,
        rightLine
      ],
    );

    var attributes = <Widget>[];
    for (var attribute in item.attributes) {
      attributes.add(Text('$attribute'));
    }

    return GameDialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          title,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemName(item: item),
              if (item.subcategoryString != null) Text(item.subcategoryString!)
            ],
          ),
          ...attributes,
          Container(
            color: Colors.white30,
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.description,
                style: const TextStyle(color: Colors.white30),
              ),
              Text(
                'ID:${item.id}',
                style: const TextStyle(color: Colors.white30),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              GameButton(
                onTap: () => _equipItem(context, ref),
                child: const Text('装备'),
              ),
              const SizedBox(width: 4),
              GameButton(child: Text('分解'))
            ],
          ),
        ],
      ),
    );
  }

  void _equipItem(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);

    var hasSameSubategory = false;
    for (var equipment in character.equipments) {
      if (equipment.subcategory == item.subcategory) {
        hasSameSubategory = true;
        break;
      }
    }
    if (!hasSameSubategory) {
      ref
          .read(characterProvider.notifier)
          .equipItems([...character.equipments, item]);
      ref.read(itemsProvider.notifier).removeItem(item);
      Navigator.of(context).pop();
    }
  }
}
