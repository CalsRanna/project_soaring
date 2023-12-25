import 'package:project_soaring/package/config/text.dart';

abstract class SoaringTrait {
  /// The type of the trait.
  ///
  /// 0: 生命值
  /// 1: 法力值
  /// 2: 力量
  /// 3: 体质
  /// 4: 智力
  /// 5: 精神
  /// 6: 敏捷
  /// 7: 速度
  /// 8: 暴击
  /// 9: 韧性
  /// 10: 穿透
  /// 11: 格挡
  /// 12: 命中
  /// 13: 闪避
  /// 14: 攻击
  /// 15: 防御
  int type = 0;
  int value = 0;

  int get score => (value * 0.8).floor();

  @override
  String toString() {
    var modification = '+';
    if (value.isNegative) {
      modification = '-';
    }
    return '$modification${value.abs()}${SoaringText.traits[type]}';
  }
}
