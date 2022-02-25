// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    name: json['name'] as String?,
    delivery_price: (json['delivery_price'] as num?)?.toDouble(),
    country_id: json['country_id'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'delivery_price': instance.delivery_price,
      'country_id': instance.country_id,
    };
