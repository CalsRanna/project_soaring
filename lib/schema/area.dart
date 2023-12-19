import 'package:isar/isar.dart';

part 'area.g.dart';

@collection
@Name('areas')
class Area {
  Id id = Isar.autoIncrement;
  String description = '';
  int level = 0;
  String name = '';
  bool stationed = false;
}
