import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'items_provider.g.dart';

@HiveType(typeId: 2)
class Item {
  Item({
    required this.category,
    required this.description,
    required this.id,
    required this.name,
    required this.quality,
    required this.quantity,
    required this.rank,
    required this.subcategory,
    required this.attributes,
  });

  @HiveField(0)
  int category;
  @HiveField(1)
  String description;
  @HiveField(2)
  int id;
  @HiveField(3)
  String name;
  @HiveField(4)
  int quality;
  @HiveField(5)
  int quantity;
  @HiveField(6)
  int rank;
  @HiveField(7)
  int subcategory;
  @HiveField(8)
  List<int> attributes;

  String get categoryString {
    var categories = ['装备', '法宝', '丹药', '符箓', '道具', '药材', '矿石', '灵物', '种子'];
    return categories[category];
  }

  Color get qualityColor {
    var colors = [
      Colors.white,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.red,
    ];
    return colors[quality];
  }

  String get rankString {
    var ranks = ['下品', '中品', '上品', '极品'];
    return ranks[rank];
  }

  /// 只有装备才有二级分类，代表了装备佩戴的位置
  String? get subcategoryString {
    var subCategories = ['头', '项链', '肩', '身体', '披风', '手腕', '腿', '脚'];
    return category == 0 ? subCategories[subcategory] : null;
  }
}

class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeItem(Item item) {
    var index = -1;
    for (var i = 0; i < state.length; i++) {
      if (state[i].id == item.id) {
        index = i;
        break;
      }
    }
    if (index >= 0) {
      state.removeAt(index);
      state = [...state];
    }
  }
}

final itemsProvider =
    StateNotifierProvider<ItemsNotifier, List<Item>>((ref) => ItemsNotifier());
