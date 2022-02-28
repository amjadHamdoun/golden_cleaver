// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionData _$SectionDataFromJson(Map<String, dynamic> json) {
  return SectionData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    area_id: json['area_id'] as int?,
    country_id: json['country_id'] as int?,
    city_id: json['city_id'] as int?,
  );
}

Map<String, dynamic> _$SectionDataToJson(SectionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.country_id,
      'area_id': instance.area_id,
      'city_id': instance.city_id,
    };
