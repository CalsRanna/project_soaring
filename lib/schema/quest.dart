import 'package:isar/isar.dart';

part 'quest.g.dart';

@collection
@Name('quests')
class Quest {
  Id id = Isar.autoIncrement;
  String description = '';
  int level = 0;
  String name = '';

  /// The progress of the quest.
  ///
  /// 0: 未接受
  /// 1: 进行中
  /// 2: 已完成
  int progress = 0;
  List<QuestRequirement> requirements = [];
  List<QuestReward> rewards = [];
}

@embedded
@Name('requirements')
class QuestRequirement {
  /// The number of items required to complete the quest.
  int count = 0;

  /// The target item required to complete the quest.
  int? target;

  /// The type of the requirement.
  ///
  /// 0: 驻扎
  /// 1: 击败
  /// 2: 探索
  /// 3: 到达
  int type = 0;
}

@embedded
@Name('rewards')
class QuestReward {
  int count = 0;
  int? target;

  /// The type of the reward.
  ///
  /// 0: 经验
  /// 1: 金币
  /// 2: 物品
  int type = 0;
}
