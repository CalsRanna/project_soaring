import 'package:project_soaring/core/item/item.dart';

class PresetUtil {
  static final firstCurrency =
      Item()
        ..count = 1
        ..name = '下品灵石'
        ..description = '修仙界最基础的灵石，也是最常见的货币，蕴含着较少的灵气。'
        ..rank = 1;

  static final secondCurrency =
      Item()
        ..count = 1
        ..name = '中品灵石'
        ..description = '修仙界比较基础的灵石，蕴含着较多的灵气。'
        ..rank = 2;

  static final thirdCurrency =
      Item()
        ..count = 1
        ..name = '上品灵石'
        ..description = '修仙界比较好的灵石，蕴含着较多的灵气。'
        ..rank = 3;

  static final fourthCurrency =
      Item()
        ..count = 1
        ..name = '极品灵石'
        ..description = '修仙界最好的灵石，蕴含着最多的灵气。'
        ..rank = 4;
}
