import 'package:project_soaring/package/config/text.dart';

abstract class SoaringItem {
  int level = 0;
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
}
