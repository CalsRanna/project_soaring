import 'package:project_soaring/package/config/text.dart';

abstract class SoaringItem {
  int level = 0;
  int rank = 0;
  String name = '';
  String description = '';
  int type = 0;
  bool equipped = false;
  int position = 0;
  String get typeText => SoaringText.itemTypes[type];
  String get positionText => SoaringText.positions[position];
}
