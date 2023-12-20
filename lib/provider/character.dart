import 'dart:math';

import 'package:isar/isar.dart';
import 'package:project_soaring/provider/area.dart';
import 'package:project_soaring/provider/dungeon.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/formula.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/util/label.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character.g.dart';

/// `CharacterNotifier` class
///
/// This class is responsible for handling operations related to Character.
/// It extends `_$CharacterNotifier` which provides additional functionalities to this class.
///
/// This class uses the `riverpod` package for state management and `isar` for database operations.
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

  /// Creates a new character with the given name.
  ///
  /// This function also generates the starter equipment for the character.
  /// It performs database operations to save the character and the equipment.
  ///
  /// [name] is the name of the character to be created.
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

  /// Harvests resources from an area.
  ///
  /// This function takes an [Area] as input and calculates the experience and gold gained from harvesting.
  /// The resources gained are based on the time elapsed since the last harvest and the level of the area.
  /// If the current time is before the character's next available harvest time, the function will return (0, 0).
  ///
  /// [area] The area from which resources are to be harvested.
  ///
  /// Returns a Future that completes with a Record containing the experience and gold gained from harvesting.
  Future<(int, int, String?)> harvest(Area area) async {
    final now = DateTime.now();
    final character = await future;
    if (now.isBefore(character.harvestAt)) return (0, 0, null);
    final seconds = now.difference(character.harvestAt).inSeconds;
    final count = seconds ~/ 30;
    final averageLevel = (area.level + 3) / 2;
    var experience = pow(averageLevel, 1.5) * 10 * count;
    var gold = averageLevel * 5 * count;
    final random = Random();
    final factor = random.nextDouble() + 1;
    experience = experience * factor;
    character.experience += experience.toInt();
    character.gold += gold.toInt();
    _levelUp(character);
    final dungeon = await _discover();
    character.harvestAt = now;
    await isar.writeTxn(() async {
      isar.characters.put(character);
    });
    ref.invalidateSelf();
    ref.invalidate(stationedAreaProvider);
    if (dungeon != null) {
      ref.invalidate(dungeonsNotifierProvider);
    }
    return (experience.toInt(), gold.toInt(), dungeon);
  }

  Future<void> updateExperience(int experience) async {
    final character = await future;
    character.experience += experience;
    _levelUp(character);
    await isar.writeTxn(() async {
      isar.characters.put(character);
    });
    ref.invalidateSelf();
  }

  Future<void> updateGold(int gold) async {
    final character = await future;
    character.gold += gold;
    await isar.writeTxn(() async {
      isar.characters.put(character);
    });
    ref.invalidateSelf();
  }

  Future<String?> _discover() async {
    final random = Random();
    final rate = random.nextDouble();
    if (rate >= 0.05) return null;
    final availableDungeons = await ref.read(dungeonsNotifierProvider.future);
    const dungeons = Labels.dungeons;
    if (availableDungeons.length >= dungeons.length) return null;
    int index;
    String? name;
    Dungeon? exist;
    do {
      index = random.nextInt(dungeons.length);
      name = dungeons[index]['name'];
      exist = availableDungeons
          .where((dungeon) => dungeon.name == name)
          .firstOrNull;
    } while (exist != null);
    final dungeon = Generator().dungeon(index: index);
    await isar.writeTxn(() async {
      isar.dungeons.put(dungeon);
    });
    return dungeon.name;
  }

  /// Handles the logic for leveling up the character.
  ///
  /// This method checks if the character's experience has reached or exceeded the maximum for their current level.
  /// If so, the character levels up: their level is incremented by 1, and the excess experience is carried over to the next level.
  /// The process repeats until the character's experience is less than the max for their new level.
  ///
  /// [character] is the character object to be leveled up.
  void _levelUp(Character character) {
    var max = Formula.levelUp(character.level);
    while (character.experience >= max) {
      character.experience -= max;
      character.level++;
      max = Formula.levelUp(character.level);
    }
  }
}
