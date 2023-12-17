import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_soaring/schema/character.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';

late Isar isar;

class IsarInitializer {
  static Future<void> ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [CharacterSchema, EquipmentSchema, ItemSchema],
      directory: directory.path,
    );
  }
}
