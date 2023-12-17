import 'package:flutter/material.dart';
import 'package:project_soaring/generator.dart';
import 'package:project_soaring/schema/item.dart';

class RecastPage extends StatefulWidget {
  const RecastPage({super.key});

  @override
  State<RecastPage> createState() => _RecastPageState();
}

class _RecastPageState extends State<RecastPage> {
  late Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('重铸'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text(item.name),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => ListTile(
                    // tileColor: Theme.of(context).colorScheme.surfaceVariant,
                    title: Text(
                      item.traits[index].toString(),
                    ),
                    onTap: () {
                      setState(() {
                        item.traits[index] = Generator().recast(item);
                      });
                    },
                  ),
                  itemCount: item.traits.length,
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
