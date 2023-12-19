import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';

late Isar isar;

class IsarInitializer {
  static Future<void> ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        AreaSchema,
        CharacterSchema,
        CreatureSchema,
        DungeonSchema,
        EquipmentSchema,
        ItemSchema
      ],
      directory: directory.path,
    );
  }
}
