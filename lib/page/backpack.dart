import 'package:flutter/material.dart';
import 'package:project_soaring/game/item/item.dart';
import 'package:project_soaring/widget/container.dart';

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
      appBar: AppBar(title: const Text('背包')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              // Expanded(
              //   child: Consumer(builder: (context, ref, child) {
              //     final provider = ref.watch(itemsNotifierProvider);
              //     List<Item> items = switch (provider) {
              //       AsyncData(:final value) => value,
              //       _ => [],
              //     };
              //     return GridView.count(
              //       crossAxisCount: 6,
              //       crossAxisSpacing: 4,
              //       mainAxisSpacing: 4,
              //       children: [
              //         for (var item in items)
              //           GestureDetector(
              //             behavior: HitTestBehavior.opaque,
              //             onTap: () {},
              //             child: ItemTile(
              //               item: item,
              //             ),
              //           )
              //       ],
              //     );
              //   }),
              // ),
              const _GoldIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoldIndicator extends StatelessWidget {
  const _GoldIndicator();

  @override
  Widget build(BuildContext context) {
    return SoaringContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: double.infinity,
      //
      child: const SizedBox(),
    );
  }
}
