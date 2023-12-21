import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/router/router.dart';
import 'package:project_soaring/widget/container.dart';

class TrialsPage extends StatefulWidget {
  const TrialsPage({super.key});

  @override
  State<TrialsPage> createState() => _TrialsPageState();
}

class _TrialsPageState extends State<TrialsPage> {
  late ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('无尽试炼')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
            cacheExtent: 64,
            itemBuilder: (context, index) => Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => startTrail(ref, index),
                  child: SoaringContainer(
                    height: 64,
                    child: Center(child: Text('第${index + 1}层')),
                  ),
                );
              },
            ),
            itemCount: 100,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController(initialScrollOffset: 0);
  }

  void startTrail(WidgetRef ref, int index) async {
    final creatures = await ref.read(creaturesNotifierProvider.future);
    if (creatures.isEmpty) {
      final notifier = ref.read(creaturesNotifierProvider.notifier);
      await notifier.spawn(level: max((index ~/ 10), 1));
    }
    if (!mounted) return;
    const CombatPageRoute().push(context);
  }
}
