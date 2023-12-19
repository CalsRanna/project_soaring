import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stat.g.dart';

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
  if (stat == 2 || stat == 3) {
    value += character.level * 10;
  }
  if (stat == 0 || stat == 1) {
    value += character.level * 1;
  }
  return value;
}
