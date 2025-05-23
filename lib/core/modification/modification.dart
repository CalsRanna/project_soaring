class Modification {
  int key = 0;
  int value = 0;

  Modification();

  Modification.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value};
  }
}
