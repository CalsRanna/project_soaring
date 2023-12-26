import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_soaring/widget/modal.dart';

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
      builder: (context) => _CombatPage(),
    );
  }
}

class _CombatPage extends StatefulWidget {
  const _CombatPage({super.key});

  @override
  State<_CombatPage> createState() => __CombatPageState();
}

class __CombatPageState extends State<_CombatPage> {
  double left = 0;
  double top = 32;
  double initLeft = 0;
  double right = 0;
  double bottom = 0;
  double initRight = 0;
  double initBottom = 0;
  List<double> x = [];
  List<double> y = [];

  List<CombatEntry> offenders = [
    CombatEntry(),
  ];
  List<CombatEntry> defenders = [
    CombatEntry(),
  ];

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
            child: Container(
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
                        for (var i = 0; i < offenders.length; i++)
                          _CombatTile(x: offenders[i].x, y: offenders[i].y),
                        for (var i = 0; i < defenders.length; i++)
                          _CombatTile(x: defenders[i].x, y: defenders[i].y),
                      ],
                    ),
                  ),
                  Text('${round <= 5 ? '${5 - round + 1}回合后可' : ''}跳过战斗'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleTap() {
    if (round > 5) {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      combat();
    });
  }

  @override
  void didChangeDependencies() {
    calculatePosition();
    super.didChangeDependencies();
  }

  void calculatePosition() {
    if (!mounted) return;
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final width = size.width;
    const height = 256;
    for (var i = 0; i < offenders.length; i++) {
      var offenderHeight = height / offenders.length;
      var x = (width / 2 - 64) / 2;
      var y = (offenderHeight - 64) / 2 + i * offenderHeight;
      if (offenders[i].target != null) {
        var defenderHeight = height / defenders.length;
        x += width / 2;
        x -= 32;
        y = (defenderHeight - 64) / 2 + offenders[i].target! * defenderHeight;
      }
      offenders[i] = offenders[i].copyWith(
        target: offenders[i].target,
        x: x,
        y: y,
      );
    }
    for (var i = 0; i < defenders.length; i++) {
      var defenderHeight = height / defenders.length;
      var x = (width / 2 - 64) / 2 + width / 2;
      var y = (defenderHeight - 64) / 2 + i * defenderHeight;
      if (defenders[i].target != null) {
        var offenderHeight = height / offenders.length;
        x -= width / 2;
        x += 32;
        y = (offenderHeight - 64) / 2 + defenders[i].target! * offenderHeight;
      }
      defenders[i] = defenders[i].copyWith(
        target: defenders[i].target,
        x: x,
        y: y,
      );
    }
    setState(() {
      offenders = [...offenders];
      defenders = [...defenders];
    });
  }

  void combat() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    while (round <= maxRound) {
      for (var i = 0; i < offenders.length; i++) {
        offenders[i] = offenders[i].copyWith(target: 0);
        if (!mounted) return;
        setState(() {
          offenders = [...offenders];
        });
        calculatePosition();
        await Future.delayed(const Duration(milliseconds: 200));
        offenders[i] = offenders[i].copyWith(target: null);
        if (!mounted) return;
        setState(() {
          offenders = [...offenders];
        });
        calculatePosition();
        await Future.delayed(const Duration(milliseconds: 1000));
      }
      for (var i = 0; i < defenders.length; i++) {
        defenders[i] = defenders[i].copyWith(target: 0);
        if (!mounted) return;
        setState(() {
          defenders = [...defenders];
        });
        calculatePosition();
        await Future.delayed(const Duration(milliseconds: 200));
        defenders[i] = defenders[i].copyWith(target: null);
        if (!mounted) return;
        setState(() {
          defenders = [...defenders];
        });
        calculatePosition();
        await Future.delayed(const Duration(milliseconds: 1000));
      }
      if (!mounted) return;
      setState(() {
        round++;
      });
    }
  }
}

class _CombatTile extends StatefulWidget {
  const _CombatTile({super.key, required this.x, required this.y});

  final double x;
  final double y;

  @override
  State<_CombatTile> createState() => __CombatTileState();
}

class __CombatTileState extends State<_CombatTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
      left: widget.x,
      top: widget.y,
      child: Container(
        color: Colors.white,
        height: 64,
        width: 64,
      ),
    );
  }
}

class CombatEntry {
  final int? target;
  final double x;
  final double y;

  const CombatEntry({this.target, this.x = 0, this.y = 0});
  // copyWith
  CombatEntry copyWith({int? target, double? x, double? y}) {
    return CombatEntry(
      target: target,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CombatEntry &&
        other.x == x &&
        other.y == y &&
        other.target == target;
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, target);

  @override
  String toString() {
    return 'CombatEntry{target: $target, x: $x, y: $y}';
  }
}
