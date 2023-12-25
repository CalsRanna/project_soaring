import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/creature.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/schema/event.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/schema/quest.dart';
import 'package:project_soaring/schema/spell.dart';
import 'package:project_soaring/schema/trial.dart';

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
        EventSchema,
        ItemSchema,
        QuestSchema,
        SpellSchema,
        TrialSchema,
      ],
      directory: directory.path,
    );
  }
}
