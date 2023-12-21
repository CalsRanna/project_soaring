import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stat.g.dart';

@riverpod
Future<int> stat(StatRef ref, int type) async {
  final character = await ref.watch(characterNotifierProvider.future);
  final equipments = await ref.watch(equippedEquipmentsNotifierProvider.future);
  var value = 0;
  for (var equipment in equipments) {
    final traits = equipment.traits;
    for (var trait in traits) {
      if (trait.type == type) {
        value += trait.modification;
      }
    }
  }
  if (type == 2 || type == 3) {
    value += character.level * 10;
  }
  if (type == 0 || type == 1) {
    value += character.level * 1;
  }
  return value;
}
