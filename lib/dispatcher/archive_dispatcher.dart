import 'dart:async';

class ArchiveDispatcher {
  static Timer? archiveTimer;

  static start(void Function() callback) {
    archiveTimer?.cancel();
    archiveTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      callback();
    });
  }

  static stop() {
    archiveTimer?.cancel();
  }
}
