import 'package:isar/isar.dart';
import 'package:project_soaring/schema/equipment.dart';

part 'item.g.dart';

@collection
@Name('items')
class Item {
  Id id = Isar.autoIncrement;
  String name = '';
  int rank = 0;
  String description = '';
  int type = 0;

  List<Trait> traits = [];

  int get score {
    var value = 0;
    value += rank * 10;
    value += traits.fold(
      0,
      (previousValue, trait) => previousValue + trait.score,
    );
    return value;
  }
}
