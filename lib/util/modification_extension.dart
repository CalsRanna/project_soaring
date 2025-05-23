import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/modification/modification.dart';

extension ModificationExtension on Modification {
  String get keyString {
    return switch (key) {
      0 => Strings.emptyString,
      1 => Strings.health,
      2 => Strings.attack,
      3 => Strings.defense,
      _ => Strings.emptyString,
    };
  }
}
