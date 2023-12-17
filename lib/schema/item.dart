import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'item.g.dart';

@collection
@Name('items')
class Item {
  Id id = Isar.autoIncrement;
  String name = '';
  int rank = 0;
  int level = 0;
  @Name('extra_level')
  int extraLevel = 0;
  String description = '';
  int type = 0;
  int position = 0;

  List<Trait> traits = [];

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
    '通用',
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

@embedded
@Name('traits')
class Trait {
  int modification = 0;
  int type = 0;

  int get score => (modification * 0.1).round();

  static const traits = [
    '攻击',
    '防御',
    '生命值',
    '法力值',
    '力量',
    '敏捷',
    '智力',
    '精神',
    '体质',
    '速度',
    '暴击',
    '格挡',
    '抗性',
    '命中',
    '闪避',
    '穿透',
    '韧性',
  ];

  @override
  String toString() {
    return '+$modification ${traits[type]}';
  }
}
