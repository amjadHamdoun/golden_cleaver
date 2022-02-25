// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionModel _$AdditionModelFromJson(Map<String, dynamic> json) {
  return AdditionModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    old_price: (json['old_price'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$AdditionModelToJson(AdditionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'old_price': instance.old_price,
    };
