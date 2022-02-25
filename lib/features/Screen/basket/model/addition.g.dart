// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdditionAdapter extends TypeAdapter<Addition> {
  @override
  final int typeId = 1;

  @override
  Addition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addition(
      price: fields[2] as double?,
      id: fields[0] as int?,
      name: fields[1] as String?,
      old_price: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Addition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.old_price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
