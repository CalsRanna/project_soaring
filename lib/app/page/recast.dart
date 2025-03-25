import 'package:flutter/material.dart';
import 'package:project_soaring/game/item/item.dart';

class RecastPage extends StatefulWidget {
  const RecastPage({super.key});

  @override
  State<RecastPage> createState() => _RecastPageState();
}

class _RecastPageState extends State<RecastPage> {
  Item equipment = Item();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceContainerHighest = colorScheme.surfaceContainerHighest;
    final onSurface = colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(title: const Text('重铸')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: surfaceContainerHighest),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              // child: Text(equipment.name.isEmpty ? '+' : ''),
              child: const SizedBox(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: onSurface)),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 8),
                  // itemBuilder: _itemBuilder,
                  // itemCount: equipment.traits.length,
                  itemBuilder: (context, index) => const SizedBox(),
                  itemCount: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget? _itemBuilder(context, index) => ListTile(
  //   // tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
  //   title: Text(equipment.traits[index].toString()),
  //   onTap: () {
  //     setState(() {
  //       // equipment.traits[index] = Generator().recast();
  //     });
  //   },
  // );

  @override
  void initState() {
    super.initState();
  }
}
