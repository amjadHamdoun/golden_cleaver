// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) {
  return SizeModel(
    id: json['id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
    };
