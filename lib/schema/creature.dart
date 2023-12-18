import 'package:isar/isar.dart';

part 'creature.g.dart';

@collection
@Name('creatures')
class Creature {
  Id id = Isar.autoIncrement;
  int attack = 0;
  int defense = 0;
  int level = 1;
  int life = 0;
  int mana = 0;
  String name = '';
  int rank = 0;
}
