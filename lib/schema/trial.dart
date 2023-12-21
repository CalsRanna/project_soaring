import 'package:isar/isar.dart';
import 'package:project_soaring/schema/creature.dart';

part 'trial.g.dart';

@collection
@Name('trials')
class Trial {
  Id id = Isar.autoIncrement;
  bool completed = false;
  int floor = 0;

  final creatures = IsarLinks<Creature>();
}
