// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionModel _$AdditionModelFromJson(Map<String, dynamic> json) {
  return AdditionModel(
    id: json['id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$AdditionModelToJson(AdditionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
    };
