import 'package:isar/isar.dart';
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
}
