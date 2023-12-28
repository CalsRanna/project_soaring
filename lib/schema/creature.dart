import 'package:isar/isar.dart';
import 'package:project_soaring/schema/trait.dart';

part 'creature.g.dart';

@collection
@Name('creatures')
class Creature {
  Id id = Isar.autoIncrement;
  int experience = 0;
  int level = 0;
  String name = '';
  int rank = 0;
  List<Trait> traits = [];
}
