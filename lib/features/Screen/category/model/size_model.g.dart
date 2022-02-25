// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) {
  return SizeModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    old_price: (json['old_price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    grams_enabled: json['grams_enabled'] as int?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$SizeModelToJson(SizeModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'old_price': instance.old_price,
      'image': instance.image,
      'description': instance.description,
      'grams_enabled': instance.grams_enabled,
    };
