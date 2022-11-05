import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/game_events_provider.dart';

final gameEventScrollerController =
    StateProvider.autoDispose((ref) => ScrollController());

class GameEventLog extends HookConsumerWidget {
  const GameEventLog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(gameEventScrollerController, (previous, next) {
      var controller = ref.watch(gameEventScrollerController);
      ref
          .read(gameEventScrollerController.state)
          .state
          .jumpTo(controller.position.maxScrollExtent);
    });

    var gameEvents = ref.watch(gameEventsProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        controller: ref.watch(gameEventScrollerController),
        itemBuilder: (context, index) =>
            _GameEventLog(gameEvent: gameEvents[index]),
        itemCount: gameEvents.length,
      ),
    );
  }
}

class _GameEventLog extends StatelessWidget {
  const _GameEventLog({Key? key, required this.gameEvent}) : super(key: key);

  final GameEvent gameEvent;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${gameEvent.dateString}，${gameEvent.description}，',
        children: [
          TextSpan(
            text: gameEvent.lifetimeRewardString,
            style: TextStyle(color: gameEvent.lifetimeRewardColor),
          ),
          const TextSpan(text: '，'),
          TextSpan(
            text: gameEvent.experienceRewardString,
            style: TextStyle(color: gameEvent.experienceRewardColor),
          ),
          const TextSpan(text: '，'),
          TextSpan(
            text: gameEvent.magicStoneRewardString,
            style: TextStyle(color: gameEvent.magicStoneRewardColor),
          ),
          const TextSpan(text: '。'),
        ],
      ),
    );
  }
}
