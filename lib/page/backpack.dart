import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/item.dart';
import 'package:project_soaring/schema/item.dart';

class BackpackPage extends StatefulWidget {
  const BackpackPage({super.key});

  @override
  State<BackpackPage> createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('背包'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final provider = ref.watch(itemsNotifierProvider);
              List<Item> items = switch (provider) {
                AsyncData(:final value) => value,
                _ => [],
              };
              return GridView.count(
                crossAxisCount: 6,
                children: [
                  for (var item in items)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        child: Text(item.name),
                      ),
                    )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}