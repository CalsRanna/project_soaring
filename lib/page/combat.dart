import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/util/combat.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/button.dart';
import 'package:project_soaring/widget/container.dart';

class CombatPage extends StatefulWidget {
  const CombatPage({super.key});

  @override
  State<CombatPage> createState() => _CombatPageState();
}

class _CombatPageState extends State<CombatPage> {
  bool? win;
  List<String> logs = [];
  List<Item> items = [];
  List<Equipment> equipments = [];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer(builder: (context, ref, child) {
                    return SoaringButton(
                      text: '开始战斗',
                      onTap: () => combat(ref),
                    );
                  }),
                  const SizedBox(width: 16),
                  SoaringButton(
                    text: '离开战斗',
                    onTap: leave,
                  )
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SoaringContainer(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final text = logs[index];
                      if (text != 'LOOT') {
                        return Text(text);
                      } else {
                        final itemSpans = items
                            .map(
                              (item) => TextSpan(
                                text: '[${item.name}]',
                                style: TextStyle(
                                  color: Labels.rankColors[item.rank],
                                ),
                              ),
                            )
                            .toList();

                        final equipmentSpans = equipments
                            .map(
                              (equipment) => TextSpan(
                                text: '[${equipment.name}]',
                                style: TextStyle(
                                  color: Labels.rankColors[equipment.rank],
                                ),
                              ),
                            )
                            .toList();
                        return Text.rich(
                          TextSpan(
                            text: '获得',
                            children: [...equipmentSpans, ...itemSpans],
                          ),
                        );
                      }
                    },
                    itemCount: logs.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> combat(WidgetRef ref) async {
    final character = await ref.read(characterNotifierProvider.future);
    List<int> stats = [];
    for (var i = 0; i < Labels.traits.length; i++) {
      stats.add(await ref.read(statsProvider(i).future));
    }
    final combat = Combat(character: character, stats: stats);
    final creature = await ref.read(creatureNotifierProvider.future);
    combat.autoCombat(creature);
    setState(() {
      this.logs.clear();
    });
    List<String> logs = combat.logs;
    if (combat.win == true) {
      logs.add('获得${combat.experience}点经验，${combat.gold}铜币。');
      if (combat.items.isNotEmpty || combat.equipments.isNotEmpty) {
        setState(() {
          items.clear();
          items.addAll(combat.items);
          equipments.clear();
          equipments.addAll(combat.equipments);
        });
        logs.add('LOOT');
      }
    }
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (logs.isEmpty || !mounted) {
        timer.cancel();
      } else {
        setState(() {
          this.logs.add(logs.removeAt(0));
        });
      }
    });
  }

  void leave() {
    Navigator.of(context).pop();
  }
}
