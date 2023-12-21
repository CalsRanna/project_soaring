import 'package:isar/isar.dart';

part 'spell.g.dart';

@collection
@Name('spells')
class Spell {
  Id id = Isar.autoIncrement;
  String name = '';
  String description = '';
  List<Effect> effects = [];
}

@embedded
class Effect {
  int type = 0;
  List<int> stats = [];
  List<double> rate = [];
  int value = 0;
}
