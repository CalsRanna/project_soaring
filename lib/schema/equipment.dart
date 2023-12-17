import 'package:isar/isar.dart';
import 'package:project_soaring/util/label.dart';

part 'equipment.g.dart';

@collection
@Name('equipments')
class Equipment {
  Id id = Isar.autoIncrement;
  String description = '';
  bool equipped = false;
  @Name('extra_level')
  int extraLevel = 0;
  int level = 0;
  String name = '';
  int position = 0;
  int rank = 0;
  List<Trait> traits = [];
  int type = 0;

  int get score {
    return traits.fold(
      0,
      (previousValue, trait) => previousValue + trait.score,
    );
  }
}

@embedded
@Name('traits')
class Trait {
  int modification = 0;
  int type = 0;

  int get score => (modification * 0.8).round();

  @override
  String toString() {
    return '+$modification${Labels.traits[type]}';
  }
}
