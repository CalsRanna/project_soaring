import 'dart:async';

class ExcerciseDispatcher {
  static Timer? excerciseTimer;

  static start(void Function() callback,
      {duration = const Duration(seconds: 1)}) {
    excerciseTimer?.cancel();
    excerciseTimer = Timer.periodic(duration, (_) {
      callback();
    });
  }

  static stop() {
    excerciseTimer?.cancel();
  }
}
