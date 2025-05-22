class Item {
  String name = '';
  String description = '';
  int count = 1;
  int type = 1;
  int rank = 0;
  int element = 0;
  int position = 0;

  Item();

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    count = json['count'];
    type = json['type'];
    rank = json['rank'];
    element = json['element'];
    position = json['position'];
  }

  Item copyWith({
    String? name,
    String? description,
    int? count,
    int? type,
    int? rank,
    int? element,
    int? position,
  }) {
    return Item()
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..count = count ?? this.count
      ..type = type ?? this.type
      ..rank = rank ?? this.rank
      ..element = element ?? this.element
      ..position = position ?? this.position;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'count': count,
      'type': type,
      'rank': rank,
      'element': element,
      'position': position,
    };
  }
}
