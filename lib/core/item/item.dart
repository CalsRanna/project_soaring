import 'package:project_soaring/core/modification/modification.dart';

class Item {
  int count = 1;
  String description = '';
  int element = 0;
  List<Modification> modifications = [];
  String name = '';
  int position = 0;
  int rank = 0;
  int type = 1;

  Item();

  Item.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    description = json['description'];
    element = json['element'];

    modifications =
        (json['modifications'] as List<dynamic>)
            .map<Modification>((e) => Modification.fromJson(e))
            .toList();
    name = json['name'];
    position = json['position'];
    rank = json['rank'];
    type = json['type'];
  }

  Item copyWith({
    int? count,
    String? description,
    int? element,
    List<Modification>? modifications,
    String? name,
    int? position,
    int? rank,
    int? type,
  }) {
    return Item()
      ..count = count ?? this.count
      ..description = description ?? this.description
      ..element = element ?? this.element
      ..modifications = modifications ?? this.modifications
      ..name = name ?? this.name
      ..position = position ?? this.position
      ..rank = rank ?? this.rank
      ..type = type ?? this.type;
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'description': description,
      'element': element,
      'modifications': modifications.map((e) => e.toJson()).toList(),
      'name': name,
      'position': position,
      'rank': rank,
      'type': type,
    };
  }
}
