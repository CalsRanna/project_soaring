import 'package:project_soaring/schema/dungeon.dart';

class DungeonManager {
  Dungeon dungeon;

  DungeonManager(this.dungeon);

  bool reachable(int index) {
    final tile = dungeon.tiles[index];
    final x = tile.x;
    final y = tile.y;
    List<Tile> neighbors = [];
    if (x > 0) neighbors.add(dungeon.tiles[index - 10]);
    if (x < 9) neighbors.add(dungeon.tiles[index + 10]);
    if (y > 0) neighbors.add(dungeon.tiles[index - 1]);
    if (y < 9) neighbors.add(dungeon.tiles[index + 1]);
    final reachable =
        neighbors.where((neighbor) => neighbor.explored).firstOrNull;
    return reachable != null;
  }
}
