// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
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
    comments: (json['comments'] as List<dynamic>)
        .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'content': instance.content,
      'sizes': instance.sizes,
      'additions': instance.additions,
      'comments': instance.comments,
    };
