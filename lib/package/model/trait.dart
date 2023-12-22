import 'package:project_soaring/package/config/text.dart';

abstract class SoaringTrait {
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
