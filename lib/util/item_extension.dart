import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';
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
      0 => Strings.elementNeutral,
      1 => Strings.elementMetal,
      2 => Strings.elementWood,
      3 => Strings.elementWater,
      4 => Strings.elementFire,
      5 => Strings.elementEarth,
      _ => Strings.elementNeutral,
    };
  }

  String get rankString {
    return switch (rank) {
      0 => Strings.rank0,
      1 => Strings.rank1,
      2 => Strings.rank2,
      3 => Strings.rank3,
      4 => Strings.rank4,
      5 => Strings.rank5,
      6 => Strings.rank6,
      _ => Strings.rank0,
    };
  }

  String get positionString {
    return switch (position) {
      0 => Strings.emptyString,
      1 => Strings.positionHead,
      2 => Strings.positionBody,
      3 => Strings.positionLeg,
      4 => Strings.positionFoot,
      5 => Strings.positionTreasure,
      _ => Strings.emptyString,
    };
  }

  String get typeString {
    return switch (type) {
      1 => Strings.material,
      2 => Strings.equipment,
      3 => Strings.elixir,
      _ => Strings.emptyString,
    };
  }
}
