// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    content: json['content'] as String?,
    sub_categories: (json['sub_categories'] as List<dynamic>?)
        ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
      'sub_categories': instance.sub_categories,
    };
