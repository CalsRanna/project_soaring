import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/excercise_logs_provider.dart';

final controllerProvider = StateProvider((ref) => ScrollController());

class ExerciseLog extends HookConsumerWidget {
  const ExerciseLog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(excerciseLogsProvider, (previous, next) {
      var controller = ref.watch(controllerProvider);
      ref
          .read(controllerProvider.state)
          .state
          .jumpTo(controller.position.maxScrollExtent);
    });

    var excerciseLogs = ref.watch(excerciseLogsProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 100,
      child: ListView.builder(
        controller: ref.watch(controllerProvider),
        itemBuilder: (context, index) => Text(excerciseLogs[index].toString()),
        itemCount: excerciseLogs.length,
      ),
    );
  }
}
