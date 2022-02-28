// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityData _$CityDataFromJson(Map<String, dynamic> json) {
  return CityData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    delivery_price: (json['delivery_price'] as num?)?.toDouble(),
    country_id: json['country_id'] as int?,
  );
}

Map<String, dynamic> _$CityDataToJson(CityData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'delivery_price': instance.delivery_price,
      'country_id': instance.country_id,
    };
