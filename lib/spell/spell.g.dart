// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpellAdapter extends TypeAdapter<Spell> {
  @override
  final int typeId = 1;

  @override
  Spell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spell(
      duration: fields[2] as int,
      experience: fields[3] as double,
      name: fields[0] as String,
      rank: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Spell obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rank)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.experience);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
