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
    sizes: (json['sizes'] as List<dynamic>)
        .map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    additions: (json['additions'] as List<dynamic>)
        .map((e) => AdditionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
      'sizes': instance.sizes,
      'additions': instance.additions,
    };
