import 'package:isar/isar.dart';
import 'package:project_soaring/schema/creature.dart';

part 'character.g.dart';

@collection
@Name('characters')
class Character {
  Id id = Isar.autoIncrement;
  int gold = 0;
  DateTime harvestAt = DateTime.now();
  final creature = IsarLink<Creature>();
}
