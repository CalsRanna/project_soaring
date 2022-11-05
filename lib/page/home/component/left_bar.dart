import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/widget/game_button.dart';

class HomeLeftbar extends HookConsumerWidget {
  const HomeLeftbar({Key? key, required this.active}) : super(key: key);

  final int active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GameButton(disabled: active == 0, child: const Text('修炼')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 1, child: const Text('炼丹')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 2, child: const Text('炼器')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 3, child: const Text('制符')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 4, child: const Text('灵兽')),
        const SizedBox(height: 8),
        GameButton(disabled: active == 5, child: const Text('灵药')),
      ],
    );
  }
}
