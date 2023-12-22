import 'package:flutter/material.dart';
import 'package:project_soaring/schema/item.dart';

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
    final surfaceVariant = colorScheme.surfaceVariant;
    final onSurface = colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        title: const Text('重铸'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: surfaceVariant),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text(equipment.name.isEmpty ? '+' : ''),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: onSurface)),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => ListTile(
                    // tileColor: Theme.of(context).colorScheme.surfaceVariant,
                    title: Text(
                      equipment.traits[index].toString(),
                    ),
                    onTap: () {
                      setState(() {
                        // equipment.traits[index] = Generator().recast();
                      });
                    },
                  ),
                  itemCount: equipment.traits.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
