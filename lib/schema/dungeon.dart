import 'package:isar/isar.dart';

part 'dungeon.g.dart';

@collection
@Name('dungeons')
class Dungeon {
  Id id = Isar.autoIncrement;
  int difficulty = 0;
  bool explored = false;
  String name = '';
  String story = '';
  List<Tile> tiles = [];
}

@embedded
@Name('tiles')
class Tile {
  int difficulty = 0;
  int x = 0;
  int y = 0;
  int type = 0;
  bool explored = false;
}
