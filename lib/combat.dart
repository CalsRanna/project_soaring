import 'dart:async';

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
      builder: (context) => Center(
        child: Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          width: double.infinity,
          height: 128,
          child: _CombatPage(),
        ),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 200),
          left: left,
          top: top,
          onEnd: () {
            setState(() {
              left = initLeft;
              top = 32;
            });
          },
          child: Container(
            color: Colors.white,
            height: 64,
            width: 64,
          ),
        ),
        AnimatedPositioned(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 200),
          right: right,
          bottom: bottom,
          onEnd: () {
            setState(() {
              right = initRight;
              bottom = initBottom;
            });
          },
          child: Container(
            color: Colors.white,
            height: 64,
            width: 64,
          ),
        ),
      ],
    );
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
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final width = size.width;
    final initValue = ((width / 2) - 64) / 2;
    setState(() {
      initLeft = initValue;
      left = initValue;
      top = 32;
      initRight = initValue;
      right = initValue;
      initBottom = 32; //TODO: 多个敌人时应该计算获得
    });
    super.didChangeDependencies();
  }

  void combat() async {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final width = size.width;
    while (true) {
      if (!mounted) return;
      setState(() {
        left = left == initLeft ? width - 128 : initLeft;
        top = top == 32 ? 0 : 32;
      });
    }
  }
}
