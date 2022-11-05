import 'dart:math';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/provider/items_provider.dart';
import 'package:project_soaring/spell/spell.dart';
import 'package:project_soaring/util/game_generator.dart';
import 'package:project_soaring/util/game_helper.dart';

import 'game_events_provider.dart';

part 'character_provider.g.dart';

@HiveType(typeId: 0)
class Character {
  Character({
    required this.birthday,
    required this.equipments,
    required this.experience,
    required this.level,
    required this.life,
    required this.lifetime,
    required this.magicStone,
    required this.mana,
    required this.maxLife,
    required this.maxMana,
    required this.name,
    required this.spell,
  });

  Character.random({required this.name})
      : birthday = DateTime.now(),
        equipments = [],
        experience = 0,
        level = 0,
        life = 100,
        lifetime = Random().nextInt(50) + 50,
        magicStone = 0,
        mana = 0,
        maxLife = 100,
        maxMana = 0,
        spell = GameGenerator.spell();

  @HiveField(0)
  DateTime birthday;
  @HiveField(1)
  List<Item> equipments;
  @HiveField(2)
  double experience;
  @HiveField(3)
  int level;
  @HiveField(4)
  int lifetime;
  @HiveField(5)
  int magicStone;
  @HiveField(6)
  String name;
  @HiveField(7)
  Spell spell;
  @HiveField(8)
  double life;
  @HiveField(9)
  double maxLife;
  @HiveField(10)
  double mana;
  @HiveField(11)
  double maxMana;

  final List<int> _experiences = [10000, 1000000, 2500000, 4500000];

  final List<String> _levels = ['淬体', '凝脉', '聚气', '蜕凡'];

  int get age => DateTime.now().difference(birthday).inMinutes;

  int get attack => 1;

  String get birthdayString => GameHelper.calculateGameYear(birthday);

  bool get canLevelUp =>
      level < _experiences.length - 1 && experience >= _experiences[level + 1];

  int get defence => 1;

  Item? get equipedHead => _findEquipment(0);

  Item? get equipedNecklace => _findEquipment(1);

  Item? get equipedShoulder => _findEquipment(2);

  Item? get equipedBody => _findEquipment(3);

  Item? get equipedCloak => _findEquipment(4);

  Item? get equipedWrist => _findEquipment(5);

  Item? get equipedLeg => _findEquipment(6);

  Item? get equipedFoot => _findEquipment(7);

  Item? get equipedMainHand => _findEquipment(8);

  Item? get equipedOtherHand => _findEquipment(9);

  String get experienceString => _transformBigNumber(experience);

  bool get isDead => age > lifetime || life <= 0;

  String get lifeString => _transformBigNumber(life);

  String get levelString => _levels[level];

  double get score =>
      level + maxLife + maxMana + attack * 5 + defence + spell.rank * 10;

  String get scoreString => score.toStringAsFixed(0);

  Character copy({
    List<Item>? equipments,
    double? experience,
    int? level,
    double? life,
    int? lifetime,
    int? magicStone,
    double? mana,
    double? maxLife,
    double? maxMana,
    Spell? spell,
  }) {
    return Character(
      birthday: birthday,
      equipments: equipments ?? this.equipments,
      experience: experience ?? this.experience,
      level: level ?? this.level,
      life: life ?? this.life,
      lifetime: lifetime ?? this.lifetime,
      magicStone: magicStone ?? this.magicStone,
      mana: mana ?? this.mana,
      maxLife: maxLife ?? this.maxLife,
      maxMana: maxMana ?? this.maxMana,
      name: name,
      spell: spell ?? this.spell,
    );
  }

  String _transformBigNumber(double number) {
    var tenThounsand = experience / 10000;
    var hundredMillion = experience / 100000000;
    var string = experience.floor().toString();
    if (hundredMillion > 1) {
      string = '${hundredMillion.toStringAsFixed(2)}亿';
    } else if (tenThounsand > 1) {
      string = '${tenThounsand.toStringAsFixed(2)}万';
    }
    return string;
  }

  Item? _findEquipment(int subcategory) {
    Item? item;
    for (var equipment in equipments) {
      if (subcategory == equipment.subcategory) {
        item = equipment;
        break;
      }
    }
    return item;
  }
}

class CharacterNotifier extends StateNotifier<Character> {
  CharacterNotifier()
      : super(Character(
          birthday: DateTime.now(),
          equipments: [],
          experience: 0,
          level: 0,
          life: 100,
          lifetime: Random().nextInt(50) + 50,
          magicStone: 0,
          mana: 0,
          maxLife: 100,
          maxMana: 0,
          name: '飞升计划',
          spell: Spell.random(),
        ));

  void init(Character? character) {
    state = character ??
        Character(
          birthday: DateTime.now(),
          equipments: [],
          experience: 0,
          level: 0,
          life: 100,
          lifetime: Random().nextInt(50) + 50,
          magicStone: 0,
          mana: 0,
          maxLife: 100,
          maxMana: 0,
          name: '飞升计划',
          spell: Spell.random(),
        );
  }

  void autoExercise({offset = 0}) {
    state = state.copy(
      experience: state.experience + state.spell.efficiency + offset,
    );
  }

  void equipItems(List<Item> equipments) {
    state = state.copy(equipments: equipments);
  }

  void offlineExperience(double experience) {
    state = state.copy(
      experience: state.experience + experience,
    );
  }

  void addMagicStone(int magicStone) {
    state = state.copy(magicStone: state.magicStone + magicStone);
  }

  void levelUp() {
    if (state.canLevelUp) {
      state = state.copy(level: state.level + 1);
    }
  }

  void completeGameEvent(GameEvent event) {
    state = state.copy(
      experience: state.experience + event.experienceReward > 0
          ? state.experience + event.experienceReward
          : 0,
      lifetime: state.lifetime + event.lifetimeReward,
      magicStone: state.magicStone + event.magicStoneReward,
    );
  }

  void randomSpell() {
    state = state.copy(spell: Spell.random());
  }
}

final characterProvider = StateNotifierProvider<CharacterNotifier, Character>(
    (ref) => CharacterNotifier());
