// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 0;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character(
      birthday: fields[0] as DateTime,
      equipments: (fields[1] as List).cast<Item>(),
      experience: fields[2] as double,
      level: fields[3] as int,
      life: fields[8] as double,
      lifetime: fields[4] as int,
      magicStone: fields[5] as int,
      mana: fields[10] as double,
      maxLife: fields[9] as double,
      maxMana: fields[11] as double,
      name: fields[6] as String,
      spell: fields[7] as Spell,
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.birthday)
      ..writeByte(1)
      ..write(obj.equipments)
      ..writeByte(2)
      ..write(obj.experience)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.lifetime)
      ..writeByte(5)
      ..write(obj.magicStone)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.spell)
      ..writeByte(8)
      ..write(obj.life)
      ..writeByte(9)
      ..write(obj.maxLife)
      ..writeByte(10)
      ..write(obj.mana)
      ..writeByte(11)
      ..write(obj.maxMana);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
