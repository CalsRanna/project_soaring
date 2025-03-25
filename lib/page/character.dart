import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/toolbar.dart';
import 'package:project_soaring/config/text.dart';
import 'package:project_soaring/provider/area.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/util/formula.dart';
import 'package:project_soaring/widget/container.dart';
import 'package:project_soaring/widget/modal.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Consumer(builder: (context, ref, child) {
            final characterProvider = ref.watch(characterNotifierProvider);
            Character? character = switch (characterProvider) {
              AsyncData(:final value) => value,
              _ => null,
            };
            if (character == null) return const SizedBox();
            final areaProvider = ref.watch(stationedAreaProvider);
            Area? area = switch (areaProvider) {
              AsyncData(:final value) => value,
              _ => null,
            };
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.blue,
                        height: 16,
                        margin: EdgeInsets.all(4),
                        width: 128,
                        child: Text(
                          character.creature.value?.level.toString() ?? '',
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 4,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue[200]!),
                            color: Colors.blue,
                          ),
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                ),
                if (character.creature.value != null)
                  _StatusBar(creature: character.creature.value!),
                const SizedBox(height: 16),
                const _StatsPanel(label: '基本属性', statIndexes: [0, 14, 1, 15]),
                const _StatsPanel(
                  label: '六维属性',
                  statIndexes: [2, 3, 4, 5, 6, 7],
                ),
                const _StatsPanel(
                  label: '其他属性',
                  statIndexes: [8, 9, 10, 11, 12, 13],
                ),
                if (character != null && area != null) ...[
                  _StationedArea(
                    harvestAt: character.harvestAt,
                    name: area.name,
                    onTap: () => handleTap(ref),
                  ),
                ],
                const SizedBox(height: 16),
                const Wrap(
                  children: [_AvailableQuest()],
                ),
                const Spacer(),
                const Toolbar(),
              ],
            );
          }),
        ),
      ),
    );
  }

  void handleTap(WidgetRef ref) async {
    final area = await ref.read(stationedAreaProvider.future);
    if (area == null) return;
    final notifier = ref.read(characterNotifierProvider.notifier);
    final (experience, gold, dungeon) = await notifier.harvest(area);
    if (!mounted) return;
    Modal.of(context).show(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('驻扎期间获得：'),
          Text('「$experience」点经验值，「$gold」金币'),
          if (dungeon != null) Text('发现「$dungeon」'),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  final String? label;

  const CustomDivider({super.key, this.label});

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

class _StationedArea extends StatefulWidget {
  final DateTime harvestAt;

  final String name;
  final void Function()? onTap;
  const _StationedArea({
    required this.harvestAt,
    required this.name,
    this.onTap,
  });

  @override
  State<_StationedArea> createState() => __StationedAreaState();
}

class __StationedAreaState extends State<_StationedArea> {
  late Timer timer;
  late int duration;
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
              Text('已驻扎${format(duration)}'),
            ],
          ),
        ),
      ),
    );
  }

  int calculate() {
    return DateTime.now().difference(widget.harvestAt).inMinutes;
  }

  @override
  void didUpdateWidget(covariant _StationedArea oldWidget) {
    if (widget.harvestAt != oldWidget.harvestAt) {
      setState(() {
        duration = calculate();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String format(int minutes) {
    if (minutes < 60) return '「$minutes」分钟';
    if (minutes < 60 * 24) return '「${minutes ~/ 60}」小时';
    return '「${minutes ~/ (60 * 24)}」天';
  }

  @override
  void initState() {
    super.initState();
    duration = calculate();
    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (!mounted) return;
      setState(() {
        duration = calculate();
      });
    });
  }
}

class _StatsPanel extends StatelessWidget {
  final String label;

  final List<int> statIndexes;
  const _StatsPanel({required this.label, required this.statIndexes});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final size = media.size;
    final width = size.width / 2 - 24;
    return Column(
      children: [
        CustomDivider(label: label),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: [
              for (var i in statIndexes)
                Consumer(builder: (context, ref, child) {
                  final provider = ref.watch(statProvider(i));
                  final stat = switch (provider) {
                    AsyncData(:final value) => value,
                    _ => 0,
                  };
                  return SizedBox(
                    width: width,
                    child: Text('${SoaringText.traits[i]}：$stat'),
                  );
                }),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusBar extends StatelessWidget {
  final Creature creature;

  const _StatusBar({required this.creature});

  @override
  Widget build(BuildContext context) {
    final status = [
      '等级：${creature.level}',
      '经验值：${creature.experience} / ${Formula.levelUp(creature.level)}',
      // '金钱：${character.gold}'
    ];
    const overflow = TextOverflow.ellipsis;
    return Row(
      children: [
        SoaringContainer(
          padding: const EdgeInsets.symmetric(vertical: 4),
          width: 96,
          child: Center(child: Text(creature.name)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SoaringContainer(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                for (var i = 0; i < status.length; i++)
                  Expanded(
                    flex: i + 1,
                    child: Text(status[i], overflow: overflow),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _AvailableQuest extends StatelessWidget {
  const _AvailableQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => handleTap(context),
      child: SoaringContainer(
        borderRadius: BorderRadius.circular(4),
        height: 72,
        width: 72,
        child: const Center(child: Text('新任务')),
      ),
    );
  }

  void handleTap(BuildContext context) {
    Modal.of(context).show(child: Text('New Quest!'));
  }
}
