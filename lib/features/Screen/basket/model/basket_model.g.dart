// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketModel _$BasketModelFromJson(Map<String, dynamic> json) {
  return BasketModel(
    id: json['id'] as int?,
    size_id: json['size_id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    amount: (json['amount'] as num?)?.toDouble(),
    addition_id:
        (json['addition_id'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$BasketModelToJson(BasketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size_id': instance.size_id,
      'amount': instance.amount,
      'price': instance.price,
      'addition_id': instance.addition_id,
    };
