import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stat.g.dart';

@riverpod
Future<int> attack(AttackRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 0) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 10;
}

@riverpod
Future<int> defense(DefenseRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 1) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 10;
}

@riverpod
Future<int> life(LifeRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 2) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 10;
}

@riverpod
Future<int> mana(ManaRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 3) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 10;
}

@riverpod
Future<int> strength(StrengthRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 4) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}

@riverpod
Future<int> agility(AgilityRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 5) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}

@riverpod
Future<int> intelligence(IntelligenceRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 6) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}

@riverpod
Future<int> spirit(SpiritRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 7) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}

@riverpod
Future<int> vitality(VitalityRef ref) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == 8) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}

@riverpod
Future<int> stats(StatsRef ref, int stat) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == stat) {
        value += trait.modification;
      }
    }
  }
  return value + character.level * 1;
}
