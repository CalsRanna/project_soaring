import 'dart:math';

import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/creature.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/schema/equipment.dart';
import 'package:project_soaring/schema/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combat.g.dart';

@riverpod
class CombatNotifier extends _$CombatNotifier {
  @override
  Future<CombatBroadcast> build() async {
    var broadcast = CombatBroadcast();
    final character = await ref.read(characterNotifierProvider.future);
    broadcast.playerName = character.name;
    broadcast.playerLevel = character.level;
    broadcast.playerAttack = await ref.read(statProvider(0).future);
    broadcast.playerDefense = await ref.read(statProvider(1).future);
    broadcast.playerLife = await ref.read(statProvider(2).future);
    broadcast.playerMana = await ref.read(statProvider(3).future);
    final creatures = await ref.read(creaturesNotifierProvider.future);
    for (var creature in creatures) {
      broadcast.enemiesName.add(creature.name);
      broadcast.enemiesLevel.add(creature.level);
      broadcast.enemiesAttack.add(creature.attack);
      broadcast.enemiesDefense.add(creature.defense);
      broadcast.enemiesLife.add(creature.life);
      broadcast.enemiesMana.add(creature.mana);
    }
    return broadcast;
  }

  Future<void> attackMonster() async {
    var broadcast = await future;
    final random = Random();
    var count = random.nextInt(broadcast.enemiesLife.length) + 1;
    for (var i = 0; i < count; i++) {
      var offender = broadcast.playerName;
      var defender = broadcast.enemiesName[i];
      var damage = max(broadcast.playerAttack - broadcast.enemiesDefense[i], 0);
      broadcast.enemiesLife[i] -= damage;
      broadcast.enemiesLife[i] = max(broadcast.enemiesLife[i], 0);
      broadcast.logs.add('「$offender」对「$defender」造成「$damage」点伤害。');
      if (broadcast.enemiesLife[i] <= 0) {
        broadcast.logs.add('「$defender」死亡。');
      }
    }
    for (var i = 0; i < broadcast.enemiesLife.length; i++) {
      if (broadcast.enemiesLife[i] <= 0) {
        broadcast.enemiesAttack.removeAt(i);
        broadcast.enemiesDefense.removeAt(i);
        broadcast.enemiesLevel.removeAt(i);
        broadcast.enemiesLife.removeAt(i);
        broadcast.enemiesMana.removeAt(i);
        broadcast.enemiesName.removeAt(i);
        if (broadcast.enemiesLife.isEmpty) {
          broadcast.winner = 'player';
        }
      }
    }
    state = AsyncData(broadcast);
  }

  Future<void> attackPlayer() async {
    var broadcast = await future;
    final count = broadcast.enemiesLife.length;
    for (var i = 0; i < count; i++) {
      var offender = broadcast.enemiesName[i];
      var defender = broadcast.playerName;
      var damage = max(broadcast.enemiesAttack[i] - broadcast.playerDefense, 0);
      broadcast.playerLife -= damage;
      broadcast.playerLife = max(broadcast.playerLife, 0);
      broadcast.logs.add('「$offender」对「$defender」造成「$damage」点伤害。');
      if (broadcast.playerLife <= 0) {
        broadcast.logs.add('「$defender」死亡。');
        broadcast.winner = 'monster';
        state = AsyncData(broadcast);
        return;
      }
      state = AsyncData(broadcast);
      // await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}

class CombatBroadcast {
  CombatBroadcast();
  String playerName = '';
  int playerLevel = 0;
  int playerLife = 0;
  int playerMana = 0;
  int playerAttack = 0;
  int playerDefense = 0;
  List<String> enemiesName = [];
  List<int> enemiesLevel = [];
  List<int> enemiesLife = [];
  List<int> enemiesMana = [];
  List<int> enemiesAttack = [];
  List<int> enemiesDefense = [];
  List<String> logs = [];
  String winner = '';
  int rewardExperience = 0;
  int rewardGold = 0;
  List<Equipment> rewardEquipments = [];
  List<Item> rewardItems = [];
}
