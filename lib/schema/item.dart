import 'package:isar/isar.dart';
import 'package:project_soaring/package/model/item.dart';
import 'package:project_soaring/schema/trait.dart';

part 'item.g.dart';

@collection
@Name('items')
class Item extends SoaringItem {
  Id id = Isar.autoIncrement;
  int count = 1;
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
