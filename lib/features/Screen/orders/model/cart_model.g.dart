// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    id: json['id'] as int?,
    amount: json['amount'] as int?,
    total: (json['total'] as num?)?.toDouble(),
    size: json['size'] == null
        ? null
        : SizeModel.fromJson(json['size'] as Map<String, dynamic>),
    additions: (json['additions'] as List<dynamic>?)
        ?.map((e) => AdditionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total': instance.total,
      'amount': instance.amount,
      'size': instance.size,
      'additions': instance.additions,
    };
