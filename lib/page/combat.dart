import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/combat.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
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
  List<Item> items = [];
  List<Equipment> equipments = [];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(child: Center(
                        child: Consumer(builder: (context, ref, child) {
                          final provider = ref.watch(combatNotifierProvider);
                          final broadcast = switch (provider) {
                            AsyncData(:final value) => value,
                            _ => null,
                          };
                          if (broadcast == null || broadcast.playerLife <= 0) {
                            return const SizedBox();
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _CreatureTile(
                                attack: broadcast.playerAttack,
                                defense: broadcast.playerDefense,
                                level: broadcast.playerLevel,
                                life: broadcast.playerLife,
                                mana: broadcast.playerMana,
                                name: broadcast.playerName,
                              ),
                            ],
                          );
                        }),
                      )),
                      const SizedBox(width: 64),
                      Expanded(child: Center(
                        child: Consumer(builder: (context, ref, child) {
                          final provider = ref.watch(combatNotifierProvider);
                          final broadcast = switch (provider) {
                            AsyncData(:final value) => value,
                            _ => null,
                          };
                          if (broadcast == null) return const SizedBox();
                          final count = broadcast.enemiesLife.length;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0; i < count; i++)
                                _CreatureTile(
                                  attack: broadcast.enemiesAttack[i],
                                  defense: broadcast.enemiesDefense[i],
                                  level: broadcast.enemiesLevel[i],
                                  life: broadcast.enemiesLife[i],
                                  mana: broadcast.enemiesMana[i],
                                  name: broadcast.enemiesName[i],
                                ),
                            ],
                          );
                        }),
                      ))
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer(builder: (context, ref, child) {
                      return SoaringButton(
                        text: '攻击',
                        onTap: () => combat(ref),
                      );
                    }),
                    const SizedBox(width: 16),
                    Consumer(builder: (context, ref, child) {
                      return SoaringButton(
                        text: '逃跑',
                        onTap: () => leave(ref),
                      );
                    })
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SoaringContainer(
                    child: Consumer(builder: (context, ref, child) {
                      final provider = ref.watch(combatNotifierProvider);
                      final broadcast = switch (provider) {
                        AsyncData(:final value) => value,
                        _ => null,
                      };
                      if (broadcast == null) return const SizedBox();
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final text = broadcast.logs.reversed.elementAt(index);
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
                        itemCount: broadcast.logs.length,
                        padding: const EdgeInsets.all(8.0),
                        reverse: true,
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> combat(WidgetRef ref) async {
    final broadcast = await ref.read(combatNotifierProvider.future);
    final notifier = ref.read(combatNotifierProvider.notifier);
    while (broadcast.winner.isEmpty) {
      notifier.attackMonster();
      if (broadcast.winner.isNotEmpty) return;
      await Future.delayed(const Duration(milliseconds: 1000));
      notifier.attackPlayer();
      if (broadcast.winner.isNotEmpty) return;
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  void leave(WidgetRef ref) async {
    final notifier = ref.read(creaturesNotifierProvider.notifier);
    await notifier.remove();
    if (!mounted) return;
    Navigator.of(context).pop();
  }
}

class _CreatureTile extends StatefulWidget {
  const _CreatureTile({
    required this.attack,
    required this.defense,
    required this.level,
    required this.life,
    required this.mana,
    required this.name,
  });
  final int attack;
  final int defense;
  final int level;
  final int life;
  final int mana;
  final String name;

  @override
  State<_CreatureTile> createState() => __CreatureTileState();
}

class __CreatureTileState extends State<_CreatureTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SoaringContainer(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('[${widget.level}] ${widget.name}'),
            Text('${Labels.traits[2]}：${widget.life}'),
            Text('${Labels.traits[3]}：${widget.mana}'),
            Text('${Labels.traits[0]}：${widget.attack}'),
            Text('${Labels.traits[1]}：${widget.defense}'),
          ],
        ),
      ),
    );
  }
}
