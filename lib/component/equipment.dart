import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/button.dart';

class EquipmentTile extends StatelessWidget {
  const EquipmentTile({super.key, this.equipment, this.position, this.onTap})
      : assert(equipment != null || position != null);

  final Equipment? equipment;
  final int? position;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onSurface = colorScheme.onSurface;
    var color = onSurface;
    if (equipment != null) {
      color = Labels.rankColors[equipment!.rank];
    }
    final border = Border.all(color: color);
    final text = equipment?.name ?? Labels.positions[position!];
    final style = TextStyle(color: color);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => handleTap(context, equipment),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: border,
        ),
        height: 64,
        width: 64,
        child: Text(text, style: style, textAlign: TextAlign.center),
      ),
    );
  }

  void handleTap(BuildContext context, Equipment? equipment) async {
    if (equipment == null) return;
    showDialog(
      context: context,
      builder: (context) => EquipmentComparison(equipment: equipment),
    );
  }
}

class EquipmentComparison extends StatelessWidget {
  const EquipmentComparison({super.key, required this.equipment});

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(equippedEquipmentsNotifierProvider);
      List<Equipment> equipments = switch (provider) {
        AsyncData(:final value) => value,
        _ => [],
      };
      final equipped = equipments
          .where((element) => element.position == equipment.position)
          .firstOrNull;
      List<Widget> children = [];
      if (equipped != null && equipped != equipment) {
        children = [
          Expanded(child: EquipmentInformationTile(equipment: equipped)),
          const SizedBox(width: 16),
          Expanded(child: EquipmentInformationTile(equipment: equipment)),
        ];
      } else {
        children = [
          const Expanded(child: SizedBox()),
          Flexible(
            flex: 2,
            child: EquipmentInformationTile(equipment: equipment),
          ),
          const Expanded(child: SizedBox()),
        ];
      }
      return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      );
    });
  }
}

class EquipmentInformationTile extends StatelessWidget {
  const EquipmentInformationTile({super.key, required this.equipment});

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  equipment.name,
                  style: TextStyle(color: Labels.rankColors[equipment.rank]),
                ),
                const SizedBox(width: 8),
                if (equipment.extraLevel > 0) Text('+ ${equipment.extraLevel}'),
              ],
            ),
            Text(
              Labels.levels[equipment.rank],
              style: TextStyle(
                color: Labels.rankColors[equipment.rank],
              ),
            ),
            Text(Labels.positions[equipment.position]),
            for (var trait in equipment.traits)
              Text(
                '+ ${trait.modification} ${Labels.traits[trait.type]}',
              ),
            Text('装备评分: ${equipment.score}'),
            Text(
              equipment.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            Consumer(
              builder: (context, ref, child) => Wrap(
                spacing: 8,
                children: [
                  if (!equipment.equipped)
                    SoaringButton(
                      text: '装备',
                      onTap: () => equip(context, ref, equipment),
                    ),
                  if (equipment.equipped)
                    SoaringButton(
                      text: '卸下',
                      onTap: () => takeoff(context, ref, equipment),
                    ),
                  if (!equipment.equipped) const SoaringButton(text: '卖出'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equip(BuildContext context, WidgetRef ref, Equipment equipment) async {
    final notifier =
        ref.read(availableEquipmentsNotifierProvider(null).notifier);
    await notifier.equip(equipment);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  void takeoff(BuildContext context, WidgetRef ref, Equipment equipment) async {
    final notifier = ref.read(equippedEquipmentsNotifierProvider.notifier);
    await notifier.takeoff(equipment);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }
}
