import 'package:flutter/material.dart';
import 'package:project_soaring/core/creature/character.dart';
import 'package:project_soaring/core/item/item.dart';

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
  late final tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C')),
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
            AspectRatio(
              aspectRatio: 2 / 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(''),
                  );
                },
                itemCount: 8,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [Tab(text: 'E'), Tab(text: 'M')],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [_buildGridView('E'), _buildGridView('M')],
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

  Widget _buildGridView(String type) {
    var items = switch (type) {
      'E' => widget.items.where((item) => item.type != 0).toList(),
      'M' => widget.items.where((item) => item.type == 0).toList(),
      _ => widget.items,
    };
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Stack(
            children: [
              Center(child: Text(items[index].name)),
              Positioned(
                bottom: 4,
                right: 4,
                child: Text(
                  items[index].count.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
