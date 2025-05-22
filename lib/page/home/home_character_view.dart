import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/widget/equipment_slot.dart';
import 'package:project_soaring/widget/item_slot.dart';

class HomeCharacterView extends StatefulWidget {
  final Character character;
  final int currency;
  final List<Item> items;
  const HomeCharacterView({
    super.key,
    required this.character,
    this.currency = 0,
    this.items = const <Item>[],
  });

  @override
  State<HomeCharacterView> createState() => _HomeCharacterViewState();
}

class _HomeCharacterViewState extends State<HomeCharacterView>
    with TickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
              child: Row(
                spacing: 8,
                children: [
                  Text(widget.character.name),
                  Text('[${widget.character.level}]'),
                  Text('${widget.character.experience}'),
                  Spacer(),
                  Text(widget.currency.toString()),
                ],
              ),
            ),
            _buildEquipments(),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [Tab(text: '材料'), Tab(text: '装备'), Tab(text: '丹药')],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        _buildInventory('E'),
                        _buildInventory('M'),
                        _buildInventory('D'),
                      ],
                    ),
                  ),
                ],
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
          return EquipmentSlot(placeholder: placeholders[index]);
        },
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildInventory(String type) {
    var items = switch (type) {
      'M' => widget.items.where((item) => item.type == 1).toList(),
      'E' => widget.items.where((item) => item.type == 2).toList(),
      'D' => widget.items.where((item) => item.type == 3).toList(),
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
        return ItemSlot(item: items[index]);
      },
      itemCount: items.length,
    );
  }
}
