import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/toolbar.dart';
import 'package:project_soaring/provider/area.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/schema/area.dart';
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
          final provider = ref.watch(stationedAreaProvider);
          Area? area = switch (provider) {
            AsyncData(:final value) => value,
            _ => null,
          };
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
                  if (area != null)
                    _StationedArea(
                      harvestAt: value.harvestAt,
                      name: area.name,
                      onTap: () => handleTap(ref),
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

  void handleTap(WidgetRef ref) async {
    final area = await ref.read(stationedAreaProvider.future);
    if (area == null) return;
    final notifier = ref.read(characterNotifierProvider.notifier);
    notifier.harvest(area);
  }
}

class _StationedArea extends StatefulWidget {
  const _StationedArea({
    required this.harvestAt,
    required this.name,
    this.onTap,
  });

  final DateTime harvestAt;
  final String name;
  final void Function()? onTap;

  @override
  State<_StationedArea> createState() => __StationedAreaState();
}

class __StationedAreaState extends State<_StationedArea> {
  late Timer timer;
  late int duration;
  @override
  void initState() {
    super.initState();
    duration = calculate();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        duration = calculate();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: duration > 0 ? widget.onTap : null,
      child: SoaringContainer(
        height: 64,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('当前驻扎：「${widget.name}」'),
              Text('已驻扎「$duration」分钟'),
            ],
          ),
        ),
      ),
    );
  }

  int calculate() {
    return DateTime.now().difference(widget.harvestAt).inMinutes;
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
