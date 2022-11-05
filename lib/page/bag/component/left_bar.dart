import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/widget/game_button.dart';

class BagLeftBar extends HookConsumerWidget {
  const BagLeftBar({Key? key, required this.active}) : super(key: key);

  final int active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GameButton(disabled: active == 0, child: const Text('装备')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 1, child: const Text('法宝')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 2, child: const Text('丹药')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 3, child: const Text('符箓')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 4, child: const Text('药材')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 5, child: const Text('材料')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 6, child: const Text('道具')),
      ],
    );
  }
}
