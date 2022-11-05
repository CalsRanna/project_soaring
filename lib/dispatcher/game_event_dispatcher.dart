import 'dart:async';

class GameEventDispatcher {
  static Timer? gameEventTimer;

  static start(void Function() callback,
      {duration = const Duration(seconds: 1)}) {
    gameEventTimer?.cancel();
    gameEventTimer = Timer.periodic(duration, (_) {
      callback();
    });
  }

  static stop() {
    gameEventTimer?.cancel();
  }
}
