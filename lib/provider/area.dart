import 'package:isar/isar.dart';
import 'package:project_soaring/schema/area.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:project_soaring/util/label.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'area.g.dart';

@riverpod
class AreasNotifier extends _$AreasNotifier {
  @override
  Future<List<Area>> build() async {
    final areas = await isar.areas.where().findAll();
    return areas;
  }

  Future<void> generate() async {
    final generated = await isar.areas.count() > 0;
    if (generated) return;
    List<Area> areas = [];
    final generator = Generator();
    for (var i = 0; i < 20; i++) {
      const presets = Labels.areas;
      areas.add(generator.area(
        level: i * 3 + 1,
        name: presets[i]['name'],
        description: presets[i]['description'],
      ));
    }
    await isar.writeTxn(() async {
      await isar.areas.putAll(areas);
    });
    ref.invalidateSelf();
    await future;
  }

  Future<void> station(Area area) async {
    final areas = await future;
    for (var element in areas) {
      if (element.id == area.id) {
        element.stationed = true;
      } else {
        element.stationed = false;
      }
    }
    await isar.writeTxn(() async {
      await isar.areas.putAll(areas);
    });
    ref.invalidateSelf();
  }
}

@riverpod
Future<Area?> stationedArea(StationedAreaRef ref) async {
  final areas = await ref.watch(areasNotifierProvider.future);
  return areas.where((area) => area.stationed).firstOrNull;
}
