import 'package:flutter/material.dart';
import 'package:project_soaring/game/item/item.dart';
import 'package:project_soaring/app/util/label.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, this.item, this.position, this.onTap})
    : assert(item != null || position != null);

  final Item? item;
  final int? position;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onSurface = colorScheme.onSurface;
    var color = onSurface;
    if (item != null) {
      // color = Labels.rankColors[item!.rank];
      color = Labels.rankColors[0];
    }
    var border = Border.all(color: color);
    var style = TextStyle(color: color);
    final surfaceContainerHighest = colorScheme.surfaceContainerHighest;
    if (item == null) {
      border = Border.all(color: surfaceContainerHighest);
      style = TextStyle(color: surfaceContainerHighest);
    }
    // final text = item?.name ?? SoaringText.positions[position!];
    final text = '';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => handleTap(context, item),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(border: border),
            height: 64,
            width: 64,
            child: Text(text, style: style, textAlign: TextAlign.center),
          ),
          // if (item?.type == 1)
          //   Positioned(
          //     bottom: 4,
          //     right: 4,
          //     child: Text(
          //       item?.count == null ? '' : 'x${item?.count}',
          //       style: style.copyWith(fontSize: 8),
          //     ),
          //   ),
        ],
      ),
    );
  }

  void handleTap(BuildContext context, Item? equipment) async {
    if (equipment == null) return;
    showDialog(
      context: context,
      builder: (context) => EquipmentComparison(equipment: equipment),
    );
  }
}

class EquipmentComparison extends StatelessWidget {
  const EquipmentComparison({super.key, required this.equipment});

  final Item equipment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    //   return Consumer(
    //     builder: (context, ref, child) {
    //       final provider = ref.watch(equippedEquipmentsNotifierProvider);
    //       List<Item> equipments = switch (provider) {
    //         AsyncData(:final value) => value,
    //         _ => [],
    //       };
    //       final equipped =
    //           equipments
    //               .where((element) => element.position == equipment.position)
    //               .firstOrNull;
    //       List<Widget> children = [];
    //       if (equipped != null && equipped != equipment) {
    //         children = [
    //           Expanded(child: EquipmentInformationTile(equipment: equipped)),
    //           const SizedBox(width: 16),
    //           Expanded(child: EquipmentInformationTile(equipment: equipment)),
    //         ];
    //       } else {
    //         children = [
    //           const Expanded(child: SizedBox()),
    //           Flexible(
    //             flex: 2,
    //             child: EquipmentInformationTile(equipment: equipment),
    //           ),
    //           const Expanded(child: SizedBox()),
    //         ];
    //       }
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Center(
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: children,
    //           ),
    //         ),
    //       );
    //     },
    //   );
  }
}

class EquipmentInformationTile extends StatelessWidget {
  const EquipmentInformationTile({super.key, required this.equipment});

  final Item equipment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onSurface = colorScheme.onSurface;
    // final rankColor = Labels.rankColors[equipment.rank];
    // final textTheme = theme.textTheme;
    // final titleMedium = textTheme.titleMedium;

    return Material(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: onSurface)),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Text(
                //   equipment.name,
                //   style: titleMedium?.copyWith(color: rankColor),
                // ),
                const SizedBox(width: 8),
                // if (equipment.extraLevel > 0) Text('+ ${equipment.extraLevel}'),
              ],
            ),
            // if (equipment.type == 0) ...[
            //   Text(
            //     Labels.levels[equipment.rank],
            //     style: TextStyle(color: rankColor),
            //   ),
            //   Text(SoaringText.positions[equipment.position]),
            //   const SizedBox(height: 8),
            //   for (var trait in equipment.traits) Text(trait.toString()),
            //   const SizedBox(height: 4),
            //   Text('装备评分: ${equipment.score}'),
            // ],
            // if (equipment.type == 1)
            //   Text(equipment.description, style: TextStyle(color: rankColor)),
            // if (equipment.rank > 3) const SizedBox(height: 8),
            // if (equipment.rank > 3)
            //   Row(
            //     // crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Transform.rotate(
            //         angle: pi / 4,
            //         child: Container(color: rankColor, height: 8, width: 8),
            //       ),
            //       const SizedBox(width: 8),
            //       Expanded(
            //         child: Text(
            //           equipment.description,
            //           style: TextStyle(color: rankColor),
            //         ),
            //       ),
            //     ],
            //   ),
            // if (equipment.type == 0) ...[
            //   const SizedBox(height: 8),
            //   Consumer(
            //     builder:
            //         (context, ref, child) => Wrap(
            //           spacing: 8,
            //           children: [
            //             if (!equipment.equipped)
            //               SoaringButton(
            //                 text: '装备',
            //                 onTap: () => equip(context, ref, equipment),
            //               ),
            //             if (equipment.equipped)
            //               SoaringButton(
            //                 text: '卸下',
            //                 onTap: () => takeoff(context, ref, equipment),
            //               ),
            //             if (!equipment.equipped)
            //               SoaringButton(
            //                 text: '卖出',
            //                 onTap: () => sold(context, ref, equipment),
            //               ),
            //           ],
            //         ),
            // ),
            // ],
          ],
        ),
      ),
    );
  }

  // void equip(BuildContext context, WidgetRef ref, Item equipment) async {
  //   final notifier = ref.read(
  //     availableEquipmentsNotifierProvider(null).notifier,
  //   );
  //   await notifier.equip(equipment);
  //   if (!context.mounted) return;
  //   Navigator.of(context).pop();
  // }

  // void takeoff(BuildContext context, WidgetRef ref, Item equipment) async {
  //   final notifier = ref.read(equippedEquipmentsNotifierProvider.notifier);
  //   await notifier.takeoff(equipment);
  //   if (!context.mounted) return;
  //   Navigator.of(context).pop();
  // }

  // void sold(BuildContext context, WidgetRef ref, Item equipment) async {
  //   final notifier = ref.read(
  //     availableEquipmentsNotifierProvider(null).notifier,
  //   );
  //   await notifier.sold(equipment);
  //   if (!context.mounted) return;
  //   Navigator.of(context).pop();
  // }
}
