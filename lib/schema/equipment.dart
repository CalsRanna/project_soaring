import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:project_soaring/schema/item.dart';

part 'equipment.g.dart';

@collection
@Name('equipments')
class Equipment {
  Id id = Isar.autoIncrement;
  String description = '';
  bool equipped = false;
  @Name('extra_level')
  int extraLevel = 0;
  int level = 0;
  String name = '';
  int position = 0;
  int rank = 0;
  List<Trait> traits = [];
  int type = 0;

  int get score =>
      level * 10 +
      extraLevel * 5 +
      traits.fold(
        0,
        (a, b) => a + b.score,
      );

  static const levelColors = [
    Colors.grey,
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.orange,
  ];
  static const levels = [
    '粗糙',
    '普通',
    '优秀',
    '精良',
    '史诗',
    '传说',
  ];
  // types: 0-item, 1-equipment
  static const positions = [
    '头部',
    '颈部',
    '肩膀',
    '背部',
    '胸部',
    '手腕',
    '腰部',
    '腿部',
    '手指',
    '手指',
    '饰品',
    '饰品',
    '主手',
    '副手',
  ];
}
