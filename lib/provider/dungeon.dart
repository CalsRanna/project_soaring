import 'package:isar/isar.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dungeon.g.dart';

@riverpod
class DungeonsNotifier extends _$DungeonsNotifier {
  @override
  Future<List<Dungeon>> build() async {
    final dungeons = await isar.dungeons.where().findAll();
    return dungeons;
  }

  Future<void> create() async {
    final dungeon = Generator().dungeon();
    await isar.writeTxn(() async {
      await isar.dungeons.put(dungeon);
    });
    ref.invalidateSelf();
    await future;
  }
}
