import 'package:isar/isar.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creature.g.dart';

@riverpod
class CreatureNotifier extends _$CreatureNotifier {
  @override
  Future<Creature> build() async {
    var creature = await isar.creatures.where().findFirst();
    if (creature == null) {
      creature = Creature();
      await isar.writeTxn(() async {
        isar.creatures.put(creature!);
      });
    }
    return creature;
  }

  Future<void> spawn() async {
    final creature = Generator().spawn();
    await isar.writeTxn(() async {
      await isar.creatures.put(creature);
    });
    ref.invalidateSelf();
    await future;
  }
}
