class Creature {
  String name = 'Creature';
  int level = 1;
  int health = 100;
  int attack = 1;
  int defense = 1;
  int experience = 0;

  Creature();

  Creature copyWith({
    String? name,
    int? level,
    int? health,
    int? attack,
    int? defense,
    int? experience,
  }) {
    return Creature()
      ..name = name ?? this.name
      ..level = level ?? this.level
      ..health = health ?? this.health
      ..attack = attack ?? this.attack
      ..defense = defense ?? this.defense
      ..experience = experience ?? this.experience;
  }
}
