import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/toolbar.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/container.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final character = ref.watch(characterNotifierProvider);
          return switch (character) {
            AsyncData(:final value) => Column(
                children: [
                  Row(
                    children: [
                      SoaringContainer(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: 96,
                        child: Center(child: Text(value.name)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SoaringContainer(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('等级：${value.level}'),
                              Text('经验值：${value.experience}'),
                              Text('金钱：${value.gold}'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _StatsPanel(label: '基本属性', statIndexes: [2, 0, 3, 1]),
                  const _StatsPanel(
                    label: '六维属性',
                    statIndexes: [4, 7, 8, 5, 6, 9],
                  ),
                  const _StatsPanel(
                    label: '其他属性',
                    statIndexes: [10, 16, 15, 11, 13, 14, 12],
                  ),
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

class _StatsPanel extends StatelessWidget {
  const _StatsPanel({required this.label, required this.statIndexes});

  final String label;
  final List<int> statIndexes;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final size = media.size;
    final width = size.width / 2 - 16;
    return Column(
      children: [
        CustomDivider(label: label),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: [
              for (var i in statIndexes)
                Consumer(builder: (context, ref, child) {
                  final provider = ref.watch(statsProvider(i));
                  final stat = switch (provider) {
                    AsyncData(:final value) => value,
                    _ => 0,
                  };
                  return SizedBox(
                    width: width,
                    child: Text('${Labels.traits[i]}：$stat'),
                  );
                }),
            ],
          ),
        ),
      ],
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
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
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
