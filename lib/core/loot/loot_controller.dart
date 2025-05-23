import 'package:project_soaring/core/item/item.dart';
import 'dart:math';

import 'package:project_soaring/util/item_extension.dart';

class LootController {
  final List<String> _prefixes = [
    '普通的',
    '闪亮的',
    '神秘的',
    '古老的',
    '稀有的',
    '发光的',
    '破损的',
    '强化的',
    '精致的',
    '传奇的',
    '神圣的',
    '邪恶的',
    '被诅咒的',
    '祝福的',
    '远古的',
  ];

  final List<String> _materialNames = [
    '矿石',
    '草药',
    '兽皮',
    '兽骨',
    '羽毛',
    '鳞片',
    '果实',
    '水晶',
    '精华',
    '魂石',
    '灵核',
    '符石',
    '符文',
    '灵草',
  ];

  final List<String> _equipmentNames = [
    '剑',
    '刀',
    '弓',
    '法杖',
    '护符',
    '铠甲',
    '护手',
    '靴子',
    '头盔',
    '戒指',
    '项链',
    '披风',
    '手套',
    '腰带',
    '护腿',
  ];

  final List<String> _consumableNames = [
    '药水',
    '卷轴',
    '符箓',
    '丹药',
    '灵符',
    '卷轴',
    '符咒',
    '灵药',
    '仙丹',
    '灵酒',
    '灵茶',
    '灵果',
    '灵食',
    '灵符',
    '符纸',
  ];

  final Random _random = Random();

  Item generateLoot({int? rank, int? element, int? type}) {
    final itemRank = rank ?? _generateRank();
    final itemElement = element ?? _generateElement();
    final itemType = type ?? _generateType();

    final item =
        Item()
          ..type = itemType
          ..rank = itemRank
          ..element = itemElement
          ..count = _generateCount(itemRank);

    _setupItemNameAndDescription(item);
    _setupItemPosition(item);

    return item;
  }

  int _generateRank() {
    final roll = _random.nextDouble();
    if (roll < 0.4) return 0;
    if (roll < 0.7) return 1;
    if (roll < 0.85) return 2;
    if (roll < 0.95) return 3;
    if (roll < 0.99) return 4;
    if (roll < 0.999) return 5;
    return 6;
  }

  int _generateElement() {
    final roll = _random.nextDouble();
    if (roll < 0.01) return 0;
    return _random.nextInt(5) + 1;
  }

  int _generateType() {
    final roll = _random.nextDouble();
    if (roll < 0.5) return 2;
    if (roll < 0.8) return 1;
    return 3;
  }

  int _generateCount(int rank) {
    switch (rank) {
      case 0:
        return _random.nextInt(10) + 1;
      case 1:
        return _random.nextInt(5) + 1;
      case 2:
        return _random.nextInt(3) + 1;
      case 3:
        return 1;
      case 4:
        return 1;
      case 5:
        return 1;
      case 6:
        return 1;
      default:
        return 1;
    }
  }

  void _setupItemNameAndDescription(Item item) {
    final prefix = _prefixes[_random.nextInt(_prefixes.length)];
    String itemName;
    String description;

    switch (item.type) {
      case 1:
        itemName =
            '$prefix${_materialNames[_random.nextInt(_materialNames.length)]}';
        description = '一种$itemName，散发着${item.elementString}属性的气息。';
        break;
      case 2:
        itemName =
            '$prefix${_equipmentNames[_random.nextInt(_equipmentNames.length)]}';
        description = '一件$itemName，蕴含着${item.elementString}属性的力量。';
        break;
      case 3:
        itemName =
            '$prefix${_consumableNames[_random.nextInt(_consumableNames.length)]}';
        description = '一瓶$itemName，能够恢复使用者的${item.elementString}属性灵力。';
        break;
      default:
        itemName = '未知物品';
        description = '这是一个神秘的物品，它的用途不明。';
    }

    item.name = itemName;
    item.description = description;
  }

  void _setupItemPosition(Item item) {
    if (item.type == 2) {
      item.position = _random.nextInt(5);
      return;
    }
    item.position = 0;
  }
}
