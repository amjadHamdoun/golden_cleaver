// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketAdapter extends TypeAdapter<Basket> {
  @override
  final int typeId = 0;

  @override
  Basket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Basket(
      amount: fields[2] as double?,
      price: fields[3] as double?,
      id: fields[0] as int?,
      size_id: fields[1] as int?,
      priceWithAddition: fields[4] as double?,
      name: fields[6] as String?,
      image: fields[5] as String?,
      additions: (fields[8] as List).cast<Addition>(),
      sizeName: fields[7] as String?,
      sizePrice: fields[9] as double?,
      addition_id: (fields[10] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Basket obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.size_id)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.priceWithAddition)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.sizeName)
      ..writeByte(8)
      ..write(obj.additions)
      ..writeByte(9)
      ..write(obj.sizePrice)
      ..writeByte(10)
      ..write(obj.addition_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
