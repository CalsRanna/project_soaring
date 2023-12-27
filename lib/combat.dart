import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_soaring/package/manager/combat.dart';
import 'package:project_soaring/package/model/combat.dart';
import 'package:project_soaring/package/model/trait.dart';
import 'package:project_soaring/package/type/combat.dart';
import 'package:project_soaring/schema/trait.dart';

class CombatDemoPage extends StatefulWidget {
  const CombatDemoPage({super.key});

  @override
  State<CombatDemoPage> createState() => _CombatDemoPageState();
}

class _CombatDemoPageState extends State<CombatDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DEMO')),
      body: Center(
        child: ElevatedButton(onPressed: start, child: const Text('START')),
      ),
    );
  }

  void start() {
    showDialog(
      context: context,
      builder: (context) => const _CombatPage(),
    );
  }
}

class _CombatPage extends StatefulWidget {
  const _CombatPage();

  @override
  State<_CombatPage> createState() => __CombatPageState();
}

class __CombatPageState extends State<_CombatPage> {
  List<SoaringCombatEntry> entries = [];
  late SoaringCombatManager combat;

  int round = 1;
  int maxRound = 20;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceVariant = colorScheme.surfaceVariant;
    return PopScope(
      canPop: false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: handleTap,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(color: surfaceVariant),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('第${min(round, maxRound)}/$maxRound回合'),
                      SizedBox(
                        height: 256,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            for (var i = 0; i < entries.length; i++)
                              _CombatTile(entry: entries[i]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text('${round <= 5 ? '${5 - round + 1}回合后可' : '点击此处'}跳过战斗'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    spawn();
    super.didChangeDependencies();
  }

  void handleLoop(int round) {
    if (!mounted) return;
    setState(() {
      this.round = round;
    });
  }

  void handleTap() {
    if (round > 5) {
      combat.skip();
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      simulate();
    });
  }

  void simulate() async {
    combat.simulate();
  }

  void spawn() {
    if (!mounted) return;
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final width = size.width;
    const double height = 256;
    combat = SoaringCombatManager(
      battlegroundSize: Size(width, height),
      onLoop: handleLoop,
    );
    for (var i = 0; i < 5; i++) {
      var entry = SoaringCombatEntry();
      List<SoaringTrait> traits = [];
      traits.add(Trait()
        ..type = 0
        ..value = 100);
      traits.add(Trait()
        ..type = 14
        ..value = 20);
      traits.add(Trait()
        ..type = 15
        ..value = 10);
      entry.traits = traits;
      if (i >= 2) entry.position = SoaringCombatPosition.defender;
      entries.add(entry);
    }
    combat.spawn(entries);
    setState(() {});
  }
}

class _CombatTile extends StatefulWidget {
  final SoaringCombatEntry entry;

  const _CombatTile({required this.entry});

  @override
  State<_CombatTile> createState() => __CombatTileState();
}

class __CombatTileState extends State<_CombatTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
      left: widget.entry.x,
      top: widget.entry.y,
      child: Container(
        color: Colors.red[100],
        height: 64,
        width: 64,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.red,
            height: widget.entry.remainLife * 64 / widget.entry.life,
            width: 64,
            child: Text('${widget.entry.remainLife}/${widget.entry.life}'),
          ),
        ),
      ),
    );
  }
}
