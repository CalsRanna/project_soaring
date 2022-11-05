import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/widget/game_button.dart';

class AdventureLeftBar extends HookConsumerWidget {
  const AdventureLeftBar({Key? key, required this.active}) : super(key: key);

  final int active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GameButton(disabled: active == 0, child: const Text('万妖山')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 1, child: const Text('天青谷')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 2, child: const Text('上古废墟')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 3, child: const Text('登仙路')),
      ],
    );
  }
}
