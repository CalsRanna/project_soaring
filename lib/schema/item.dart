import 'package:isar/isar.dart';
import 'package:project_soaring/config/text.dart';
import 'package:project_soaring/schema/trait.dart';

part 'item.g.dart';

@collection
@Name('items')
class Item {
  Id id = Isar.autoIncrement;
  int count = 1;
  int level = 0;

  /// The rank of the item.
  ///
  /// 0: 粗糙
  /// 1: 普通
  /// 2: 优秀
  /// 3: 精良
  /// 4: 史诗
  /// 5: 传说
  int rank = 0;

  String name = '';
  String description = '';

  /// The type of the item.
  ///
  /// 0: 装备
  /// 1: 道具
  int type = 0;
  bool equipped = false;

  /// The position of the item.
  ///
  /// 0: 头部
  /// 1: 颈部
  /// 2: 肩膀
  /// 3: 背部
  /// 4: 胸部
  /// 5: 手腕
  /// 6: 腰部
  /// 7: 腿部
  /// 8: 手指
  /// 9: 饰品
  /// 10: 主手
  /// 11: 副手
  int position = 0;
  String get typeText => SoaringText.itemTypes[type];
  String get positionText => SoaringText.positions[position];
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
