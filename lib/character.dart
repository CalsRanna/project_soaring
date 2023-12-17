import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/toolbar.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/widget/bordered_container.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('角色'),
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final character = ref.watch(characterNotifierProvider);
          return switch (character) {
            AsyncData(:final value) => Column(
                children: [
                  Row(
                    children: [
                      BorderedContainer(
                        child: Column(
                          children: [
                            Text(value.name),
                            Text('等级：${value.level}'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: BorderedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('经验值：${value.experience}'),
                              Text('金钱：${value.gold}'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomDivider(label: '基本属性'),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(attackProvider);
                              final attack = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('攻击：$attack');
                            }),
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(defenseProvider);
                              final defense = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('防御：$defense');
                            }),
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(lifeProvider);
                              final life = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('生命值：$life');
                            }),
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(manaProvider);
                              final mana = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('法力值：$mana');
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(strengthProvider);
                              final value = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('力量：$value');
                            }),
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(agilityProvider);
                              final value = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('敏捷：$value');
                            }),
                            Consumer(builder: (context, ref, child) {
                              final provider = ref.watch(intelligenceProvider);
                              final value = switch (provider) {
                                AsyncData(:final value) => value,
                                _ => 0,
                              };
                              return Text('智力：$value');
                            }),
                            const Text('精神：0'),
                            const Text('体质：0'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomDivider(label: '其他属性'),
                  const SizedBox(height: 16),
                  const Spacer(),
                  const Toolbar(),
                ],
              ),
            _ => const SizedBox(),
          };
        }),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
            ),
            width: 8,
            height: 8,
          ),
        ),
        const SizedBox(width: 16),
        Text(label ?? ''),
        const SizedBox(width: 16),
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
            ),
            width: 8,
            height: 8,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
