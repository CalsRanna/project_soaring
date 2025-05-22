import 'package:flutter/material.dart';
import 'package:project_soaring/core/item/item.dart';

extension ItemExtension on Item {
  Color get color {
    return switch (rank) {
      0 => Colors.grey,
      1 => Colors.black,
      2 => Colors.green,
      3 => Colors.blue,
      4 => Colors.purple,
      5 => Colors.orange,
      6 => Colors.red,
      _ => Colors.black,
    };
  }

  String get elementString {
    return switch (element) {
      0 => '无',
      1 => '金',
      2 => '木',
      3 => '水',
      4 => '火',
      5 => '土',
      _ => '无',
    };
  }

  String get rankString {
    return switch (rank) {
      0 => '普通',
      1 => '优秀',
      2 => '精良',
      3 => '史诗',
      4 => '传说',
      5 => '神话',
      6 => '神器',
      _ => '普通',
    };
  }

  String get positionString {
    return switch (position) {
      0 => '',
      1 => '头',
      2 => '身',
      3 => '腿',
      4 => '脚',
      5 => '法宝',
      _ => '',
    };
  }

  String get typeString {
    return switch (type) {
      1 => '材料',
      2 => '装备',
      3 => '丹药',
      _ => '',
    };
  }
}
