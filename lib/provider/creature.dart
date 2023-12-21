import 'dart:math';

import 'package:isar/isar.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creature.g.dart';

@riverpod
class CreaturesNotifier extends _$CreaturesNotifier {
  @override
  Future<List<Creature>> build() async {
    return await isar.creatures.where().findAll();
  }

  Future<void> spawn({int? level}) async {
    List<Creature> creatures = [];
    final random = Random();
    final count = random.nextInt(3) + 1;
    for (var i = 0; i < count; i++) {
      creatures.add(Generator().spawn(level: level));
    }
    await isar.writeTxn(() async {
      await isar.creatures.putAll(creatures);
    });
  }

  Future<void> remove() async {
    final creatures = await future;
    await isar.writeTxn(() async {
      await isar.creatures.deleteAll(
        creatures.map((creature) => creature.id).toList(),
      );
    });
  }
}
