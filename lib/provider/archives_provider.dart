import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArchivesNotifiter extends StateNotifier<List<String?>> {
  ArchivesNotifiter() : super([null, null, null]);

  void init(List<String?> archives) {
    state = archives;
  }
}

final archivesProvider =
    StateNotifierProvider<ArchivesNotifiter, List<String?>>(
        (ref) => ArchivesNotifiter());
