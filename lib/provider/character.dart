import 'dart:math';

import 'package:isar/isar.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character.g.dart';

@riverpod
class CharacterNotifier extends _$CharacterNotifier {
  @override
  Future<Character> build() async {
    var character = await isar.characters.where().findFirst();
    if (character == null) {
      character = Character();
      await isar.writeTxn(() async {
        isar.characters.put(character!);
      });
    }
    return character;
  }

  Future<void> create(String name) async {
    var character = await future;
    character.name = name;
    await isar.writeTxn(() async {
      isar.characters.put(character);
    });
    final equipments = Generator().starterKit();
    await isar.writeTxn(() async {
      await isar.equipments.putAll(equipments);
    });
    ref.invalidateSelf();
  }

  Future<void> harvest(Area area) async {
    final now = DateTime.now();
    final character = await future;
    if (now.isBefore(character.harvestAt)) return;
    final seconds = now.difference(character.harvestAt).inSeconds;
    final count = seconds ~/ 15;
    if (count > 0) {
      final averageLevel = (area.level + 3) / 2;
      final experience = pow(averageLevel, 1.5) * 10;
      character.experience += (experience * count).toInt();
      final gold = averageLevel * 5;
      character.gold += (gold * count).toInt();
      final random = Random();
      final factor = random.nextDouble() + 1;
      character.experience = (character.experience * factor).toInt();
    }
    character.harvestAt = now;
    await isar.writeTxn(() async {
      isar.characters.put(character);
    });
    ref.invalidateSelf();
    await future;
  }
}
