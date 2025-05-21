import 'package:project_soaring/core/creature/creature.dart';

class Character extends Creature {
  Character();

  @override
  Character copyWith({
    String? name,
    int? level,
    int? health,
    int? attack,
    int? defense,
    int? experience,
  }) {
    return Character()
      ..name = name ?? this.name
      ..level = level ?? this.level
      ..health = health ?? this.health
      ..attack = attack ?? this.attack
      ..defense = defense ?? this.defense
      ..experience = experience ?? this.experience;
  }
}
