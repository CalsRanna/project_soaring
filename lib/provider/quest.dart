import 'package:isar/isar.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/item.dart';
import 'package:project_soaring/schema/isar.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:project_soaring/schema/quest.dart';
import 'package:project_soaring/util/generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quest.g.dart';

@riverpod
class AvailableQuestsNotifier extends _$AvailableQuestsNotifier {
  @override
  Future<List<Quest>> build() async {
    return await isar.quests.filter().progressEqualTo(0).findAll();
  }

  Future<void> create(Quest quest) async {
    await isar.writeTxn(() async {
      await isar.quests.put(quest);
    });
    ref.invalidateSelf();
  }

  Future<void> complete(Quest quest) async {
    quest.progress = 2;
    await isar.writeTxn(() async {
      await isar.quests.put(quest);
    });
    for (var reward in quest.rewards) {
      switch (reward.type) {
        case 0:
          final characterNotifier =
              ref.read(characterNotifierProvider.notifier);
          characterNotifier.updateExperience(reward.count);
          break;
        case 1:
          final characterNotifier =
              ref.read(characterNotifierProvider.notifier);
          characterNotifier.updateGold(reward.count);
          break;
        case 2:
          final itemsNotifier = ref.read(itemsNotifierProvider.notifier);
          Item item;
          if (reward.target == null) {
            item = Generator().item();
          } else {
            item = await isar.items.get(reward.target!) ?? Generator().item();
          }
          itemsNotifier.add(item);
          break;
      }
    }
    ref.invalidateSelf();
    ref.invalidate(acceptedQuestsNotifierProvider);
  }
}

@riverpod
class AcceptedQuestsNotifier extends _$AcceptedQuestsNotifier {
  @override
  Future<List<Quest>> build() async {
    return await isar.quests.filter().progressEqualTo(1).findAll();
  }
}
