import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stat.g.dart';

@riverpod
Future<int> stat(StatRef ref, int type) async {
  final character = await ref.watch(characterNotifierProvider.future);
  if (character == null) return 0;
  final creature = character.creature.value;
  if (creature == null) return 0;
  var value = 0;
  for (var trait in creature.traits) {
    if (trait.type == type) {
      value += trait.value;
    }
  }
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == type) {
        value += trait.value;
      }
    }
  }
  return value;
}
