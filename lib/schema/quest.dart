import 'package:isar/isar.dart';
import 'package:project_soaring/package/model/quest.dart';

part 'quest.g.dart';

@collection
@Name('quests')
class Quest extends SoaringQuest {
  Id id = Isar.autoIncrement;
  List<QuestRequirement> requirements = [];
  List<QuestReward> rewards = [];
}

@embedded
@Name('requirements')
class QuestRequirement extends SoaringQuestRequirement {}

@embedded
@Name('rewards')
class QuestReward extends SoaringQuestReward {}
