import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/widget/bordered_container.dart';
import 'package:project_soaring/widget/tab.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('装备'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            child: Consumer(builder: (context, ref, child) {
              final provider = ref.watch(equippedEquipmentsNotifierProvider);
              final equipments = switch (provider) {
                AsyncData(:final value) => value,
                _ => [],
              };
              return Row(
                children: [
                  Column(
                    children: [
                      for (var i = 0; i < 7; i++)
                        _EquippedEquipmentTile(
                          equipment: equipments
                              .where((element) => element.position == i * 2)
                              .firstOrNull,
                        ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      for (var i = 0; i < 7; i++)
                        _EquippedEquipmentTile(
                          equipment: equipments
                              .where((element) => element.position == i * 2 + 1)
                              .firstOrNull,
                        ),
                    ],
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 4,
            children: [
              TabTile(label: '头部', onTap: () {}),
              TabTile(label: '颈部', onTap: () {}),
              TabTile(label: '肩膀', onTap: () {}),
              TabTile(label: '背部', onTap: () {}),
              TabTile(label: '胸部', onTap: () {}),
              TabTile(label: '手腕', onTap: () {}),
              TabTile(label: '腰部', onTap: () {}),
              TabTile(label: '腿部', onTap: () {}),
              TabTile(label: '手指', onTap: () {}),
              TabTile(label: '饰品', onTap: () {}),
              TabTile(label: '主手', onTap: () {}),
              TabTile(label: '副手', onTap: () {}),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final provider = ref.watch(availableEquipmentsNotifierProvider);
              List<Equipment> equipments = switch (provider) {
                AsyncData(:final value) => value,
                _ => [],
              };
              return GridView.count(
                crossAxisCount: 6,
                children: [
                  for (var equipment in equipments)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => handleTap(ref, equipment),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        child: Text(equipment.name),
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

  void handleTap(WidgetRef ref, Equipment equipment) async {
    final equipments =
        await ref.read(equippedEquipmentsNotifierProvider.future);
    final samePosition = equipments
        .where((element) => element.position == equipment.position)
        .firstOrNull;
    List<Widget> children = [];
    if (samePosition != null) {
      children = [
        Expanded(
          child: Material(
            child: EquipmentInformation(equipment: samePosition),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Material(
            child: EquipmentInformation(equipment: equipment),
          ),
        ),
      ];
    } else {
      children = [
        const Expanded(child: SizedBox()),
        Flexible(
          child: Material(
            child: EquipmentInformation(equipment: equipment),
          ),
        ),
        const Expanded(child: SizedBox()),
      ];
    }
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

class _EquippedEquipmentTile extends StatefulWidget {
  const _EquippedEquipmentTile({this.equipment});

  final Equipment? equipment;

  @override
  State<_EquippedEquipmentTile> createState() => __EquippedEquipmentTileState();
}

class __EquippedEquipmentTileState extends State<_EquippedEquipmentTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      width: 64,
      height: 64,
      child: Text(widget.equipment?.name ?? ''),
    );
  }
}

class EquipmentInformation extends StatefulWidget {
  const EquipmentInformation({super.key, required this.equipment});

  final Equipment equipment;

  @override
  State<EquipmentInformation> createState() => _EquipmentInformationState();
}

class _EquipmentInformationState extends State<EquipmentInformation> {
  static const levelColors = [
    Colors.grey,
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.orange,
  ];
  static const levels = [
    '粗糙',
    '普通',
    '优秀',
    '精良',
    '史诗',
    '传说',
  ];
  // types: 0-item, 1-equipment
  static const positions = [
    '通用',
    '头部',
    '颈部',
    '肩膀',
    '背部',
    '胸部',
    '手腕',
    '腰部',
    '腿部',
    '手指',
    '手指',
    '饰品',
    '饰品',
    '主手',
    '副手',
  ];
  static const traits = [
    '攻击',
    '防御',
    '生命',
    '速度',
    '暴击',
    '格挡',
    '抗性',
    '命中',
    '闪避',
    '穿透',
    '韧性',
    '力量',
    '敏捷',
    '智力',
    '精神',
    '体质',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(widget.equipment.name,
                  style: TextStyle(color: levelColors[widget.equipment.level])),
              const SizedBox(width: 8),
              if (widget.equipment.extraLevel > 0)
                Text('+ ${widget.equipment.extraLevel}'),
            ],
          ),
          Text(
            levels[widget.equipment.level],
            style: TextStyle(
              color: levelColors[widget.equipment.level],
            ),
          ),
          Text(positions[widget.equipment.position]),
          for (var trait in widget.equipment.traits)
            Text(
              '+ ${trait.modification} ${traits[trait.type]}',
            ),
          Text('装备评分: ${widget.equipment.score}'),
          Text(
            widget.equipment.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Row(
            children: [
              if (widget.equipment.type == 1) ...[
                Consumer(builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () => equip(ref, widget.equipment),
                    child: const BorderedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: Text('装备'),
                    ),
                  );
                }),
                const SizedBox(width: 8)
              ],
              GestureDetector(
                child: const BorderedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text('卖出'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void equip(WidgetRef ref, Equipment equipment) async {
    final notifier = ref.read(availableEquipmentsNotifierProvider.notifier);
    await notifier.equip(equipment);
    if (!mounted) return;
    Navigator.of(context).pop();
  }
}
