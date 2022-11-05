import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/dispatcher/excercise_dispatcher.dart';
import 'package:project_soaring/page/archives.dart';
import 'package:project_soaring/page/home/component/exercise_log.dart';
import 'package:project_soaring/page/home/excercise.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/provider/excercise_logs_provider.dart';
import 'package:project_soaring/provider/items_provider.dart';
import 'package:project_soaring/widget/decoration_block.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_dialog.dart';
import 'package:project_soaring/widget/item_name.dart';

Timer? timer1;
Timer? timer3;

final isExcercisingProvider = StateProvider((ref) => false);

class ExerciseParticular extends HookConsumerWidget {
  const ExerciseParticular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);
    var isExcercising = ref.watch(isExcercisingProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 18),
                Column(
                  children: [
                    _EquipmentButton(
                      item: character.equipedHead,
                      placeholder: '头',
                    ),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                      item: character.equipedShoulder,
                      placeholder: '肩',
                    ),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                      item: character.equipedCloak,
                      placeholder: '披风',
                    ),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                      item: character.equipedLeg,
                      placeholder: '腿',
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('asset/excercise.png'),
                      const _ExcerciseButton(),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _EquipmentButton(
                      item: character.equipedNecklace,
                      placeholder: '项链',
                    ),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                        item: character.equipedBody, placeholder: '身体'),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                        item: character.equipedWrist, placeholder: '手腕'),
                    const SizedBox(height: 24),
                    _EquipmentButton(
                      item: character.equipedFoot,
                      placeholder: '脚',
                    ),
                  ],
                ),
                const SizedBox(width: 18),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _EquipmentButton(decorated: true, placeholder: '法宝'),
              _EquipmentButton(
                item: character.equipedMainHand,
                placeholder: '主手',
              ),
              _EquipmentButton(
                item: character.equipedOtherHand,
                placeholder: '副手',
              ),
              _EquipmentButton(decorated: true, placeholder: '法宝'),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GameButton(
                        child: const Text('选择功法'),
                        onTap: () => _changeSpell(ref),
                      ),
                      GameButton(
                        onTap: () => _offlineExperience(context, ref),
                        child: const Text('离线修为'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const ExerciseLog(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changeSpell(WidgetRef ref) {
    ref.read(isExcercisingProvider.state).state = false;
    ref.read(characterProvider.notifier).randomSpell();

    ExcerciseDispatcher.stop();
    ExcerciseDispatcher.start(() {
      ref.read(characterProvider.notifier).autoExercise();
    });
  }

  void _offlineExperience(BuildContext context, WidgetRef ref) {
    var character = ref.watch(characterProvider);

    Widget tip = Text.rich(
      TextSpan(text: '离线收益：修为', children: [
        TextSpan(
          text: '+${character.spell.offlineEfficiencyString}',
          style: const TextStyle(color: Colors.lightGreen),
        ),
        const TextSpan(text: '/分'),
      ]),
    );

    Widget line = Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white)),
      ),
      width: 32,
    );

    Widget title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line,
        const SizedBox(width: 8),
        const Text('累计离线收益'),
        const SizedBox(width: 8),
        line,
      ],
    );

    var hasOfflineExperience = ref.watch(hasOfflineExperienceProvider);
    var offlineSeconds = ref.watch(offlineSecondsProvider);
    var offlineHours = offlineSeconds / 3600;
    var offlineHoursString = offlineHours.toStringAsFixed(2);
    var offlineExperience = character.spell.offlineEfficiency * offlineSeconds;
    var offlineExperienceString = offlineExperience.toStringAsFixed(2);

    Widget time = Text.rich(
      TextSpan(text: '离线时长：', children: [
        TextSpan(
          text: hasOfflineExperience ? offlineHoursString : '0',
          style: const TextStyle(color: Colors.lightGreen),
        ),
        const TextSpan(text: '/12小时'),
      ]),
    );

    Widget dialog = GameDialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          tip,
          const SizedBox(height: 16),
          title,
          const SizedBox(height: 4),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DecorationBlock(),
                  const SizedBox(width: 4),
                  time,
                ],
              ),
              Text(
                  '修为：${hasOfflineExperience ? offlineExperienceString : '0'}'),
              const Text('灵石：0'),
              const SizedBox(height: 4),
              GameButton(
                onTap: () => _gainOfflineExperience(ref, offlineExperience),
                child: const Text('领取离线收益'),
              ),
            ],
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => dialog,
    );
  }

  void _gainOfflineExperience(WidgetRef ref, double experience) {
    var hasOfflineExperience = ref.watch(hasOfflineExperienceProvider);
    if (hasOfflineExperience) {
      ref.read(characterProvider.notifier).offlineExperience(experience);

      var archive = ref.watch(currentArchiveProvider);
      var character = ref.watch(characterProvider);
      Hive.box<Character>('character').put(archive, character);
      ref.read(hasOfflineExperienceProvider.state).state = false;
      ref.read(offlineSecondsProvider.state).state = 0;
    }
  }
}

class _EquipmentButton extends StatefulWidget {
  const _EquipmentButton(
      {Key? key, this.decorated = false, this.item, this.placeholder})
      : super(key: key);

  final bool decorated;
  final Item? item;
  final String? placeholder;

  @override
  State<_EquipmentButton> createState() => _EquipmentButtonState();
}

class _EquipmentButtonState extends State<_EquipmentButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Widget background = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: isClicked ? Colors.white30 : Colors.black,
      ),
      height: 40,
      width: 40,
    );

    Widget transform = Transform.rotate(angle: pi / 4, child: background);

    return GestureDetector(
      onTapDown: (_) => setState(() => isClicked = true),
      onTapUp: (_) => _handleTapUp(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.decorated) background,
          transform,
          widget.item != null
              ? ItemName(item: widget.item!)
              : Text(widget.placeholder ?? '无')
        ],
      ),
    );
  }

  void _handleTapUp(BuildContext context) {
    setState(() {
      isClicked = false;
    });
  }
}

class _ExcerciseButton extends StatefulHookConsumerWidget {
  const _ExcerciseButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ExcerciseButtonState();
}

class __ExcerciseButtonState extends ConsumerState<_ExcerciseButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var isExcercising = ref.watch(isExcercisingProvider);

    return GestureDetector(
      onTapDown: (_) => setState(() => isClicked = true),
      onTapUp: (_) => _handleTapUp(ref),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30),
          color: isClicked ? Colors.white30 : null,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(24),
        child: Text('${isExcercising ? '结束' : '开始'}修炼'),
      ),
    );
  }

  void _handleTapUp(WidgetRef ref) {
    setState(() {
      isClicked = false;
    });
    var isExcercising = ref.watch(isExcercisingProvider);
    if (isExcercising) {
      ExcerciseDispatcher.stop();
      ref.read(isExcercisingProvider.state).state = false;
    } else {
      var character = ref.watch(characterProvider);
      ExcerciseDispatcher.start(() {
        var offset = Random().nextDouble() * character.spell.rank;
        ref.read(characterProvider.notifier).autoExercise(offset: offset);
        var message = (character.spell.experience + offset).toStringAsFixed(0);
        ref.read(excerciseLogsProvider.notifier).push(message);
      }, duration: Duration(seconds: character.spell.duration));

      ref.read(isExcercisingProvider.state).state = true;
    }
  }
}
