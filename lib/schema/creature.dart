import 'package:isar/isar.dart';
import 'package:project_soaring/package/model/creature.dart';
import 'package:project_soaring/schema/trait.dart';

part 'creature.g.dart';

@collection
@Name('creatures')
class Creature extends SoaringCreature {
  Id id = Isar.autoIncrement;
  List<Trait> traits = [];
}
