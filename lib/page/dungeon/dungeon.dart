import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/page/combat.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/widget/container.dart';

class DungeonPage extends StatefulWidget {
  const DungeonPage({super.key});

  @override
  State<DungeonPage> createState() => _DungeonPageState();
}

class _DungeonPageState extends State<DungeonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('地下城'),
      ),
      body: Center(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 48,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) => Consumer(
            builder: (context, ref, child) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => handleTap(ref, index),
                child: SoaringContainer(),
              );
            },
          ),
          itemCount: 81,
          shrinkWrap: true,
        ),
      ),
    );
  }

  Future<void> handleTap(WidgetRef ref, int index) async {
    final character = await ref.read(characterNotifierProvider.future);
    List<int> stats = [];
    for (int i = 0; i < 6; i++) {
      final stat = await ref.read(statsProvider(i).future);
      stats.add(stat);
    }
    final creature = Generator().spawn();
    if (!mounted) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CombatPage(
        character: character,
        creature: creature,
        stats: stats,
      ),
    ));
  }
}
