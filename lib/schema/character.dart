import 'package:isar/isar.dart';

part 'character.g.dart';

@collection
@Name('characters')
class Character {
  Id id = Isar.autoIncrement;
  int experience = 0;
  int gold = 0;
  int level = 1;
  String name = '';
}
