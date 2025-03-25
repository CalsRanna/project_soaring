import 'package:flutter/material.dart';
import 'package:project_soaring/config/text.dart';
import 'package:project_soaring/widget/tab.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  int? position;
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;
    // final onSurface = colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(title: const Text('装备')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   decoration: BoxDecoration(border: Border.all(color: onSurface)),
            //   padding: const EdgeInsets.all(4),
            //   child: Consumer(
            //     builder: (context, ref, child) {
            //       final provider = ref.watch(
            //         equippedEquipmentsNotifierProvider,
            //       );
            //       final equipments = switch (provider) {
            //         AsyncData(:final value) => value,
            //         _ => [],
            //       };
            //       return Row(
            //         children: [
            //           Wrap(
            //             direction: Axis.vertical,
            //             spacing: 4,
            //             children: [
            //               for (var i = 0; i < 6; i++)
            //                 ItemTile(
            //                   item:
            //                       equipments
            //                           .where(
            //                             (element) => element.position == i * 2,
            //                           )
            //                           .firstOrNull,
            //                   position: i * 2,
            //                 ),
            //             ],
            //           ),
            //           const Spacer(),
            //           Wrap(
            //             direction: Axis.vertical,
            //             spacing: 4,
            //             children: [
            //               for (var i = 0; i < 6; i++)
            //                 ItemTile(
            //                   item:
            //                       equipments
            //                           .where(
            //                             (element) =>
            //                                 element.position == i * 2 + 1,
            //                           )
            //                           .firstOrNull,
            //                   position: i * 2 + 1,
            //                 ),
            //             ],
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 4,
              spacing: 4,
              children: [
                for (var i = 0; i < SoaringText.positions.length; i++)
                  SoaringTab(
                    active: position == i,
                    label: SoaringText.positions[i],
                    onTap: () => handleTap(i),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            // Expanded(
            //   child: Consumer(
            //     builder: (context, ref, child) {
            //       final provider = ref.watch(
            //         availableEquipmentsNotifierProvider(position),
            //       );
            //       List<Item> equipments = switch (provider) {
            //         AsyncData(:final value) => value,
            //         _ => [],
            //       };
            //       return GridView.builder(
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 6,
            //               crossAxisSpacing: 4,
            //               mainAxisSpacing: 4,
            //             ),
            //         itemBuilder:
            //             (context, index) => ItemTile(item: equipments[index]),
            //         itemCount: equipments.length,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void handleTap(int position) {
    setState(() {
      if (this.position == position) {
        this.position = null;
      } else {
        this.position = position;
      }
    });
  }
}
