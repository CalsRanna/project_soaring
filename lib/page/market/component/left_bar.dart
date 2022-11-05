import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/widget/game_button.dart';

class MarketLeftBar extends HookConsumerWidget {
  const MarketLeftBar({Key? key, required this.active}) : super(key: key);

  final int active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GameButton(disabled: active == 0, child: const Text('藏宝阁')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 1, child: const Text('藏经阁')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 2, child: const Text('拍卖行')),
      ],
    );
  }
}
