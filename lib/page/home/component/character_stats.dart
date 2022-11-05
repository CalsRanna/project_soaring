import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_dialog.dart';
import 'package:project_soaring/widget/spell_name.dart';

final List<String> levels = ['淬体', '凝脉', '聚气', '蜕凡'];

class CharacterStats extends HookConsumerWidget {
  const CharacterStats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);
    var efficiency = (character.spell.experience / character.spell.duration)
        .toStringAsFixed(2);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('生命值：${character.life}'),
                      Text('灵力：${character.mana}'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('攻击：${character.attack}'),
                      Text('防御：${character.defence}'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(color: Colors.white, width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('境界：${levels[character.level]}境'),
                      GameButton(
                        size: GameButtonSize.small,
                        onTap: () => {},
                        child: const Text('突破'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('功法：'),
                      GestureDetector(
                        onTap: () => _showSpellParticular(context, ref),
                        child: SpellName(spell: character.spell),
                      )
                    ],
                  ),
                  Text(
                      '效率：$efficiency (${character.spell.experience.toStringAsFixed(2)}/${character.spell.duration}秒)'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSpellParticular(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => GameDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpellName(spell: character.spell),
            Text('品质：${character.spell.rank}'),
            Text(
                '修炼效率：${character.spell.experience.toStringAsFixed(2)}/${character.spell.duration}秒'),
          ],
        ),
      ),
    );
  }
}
