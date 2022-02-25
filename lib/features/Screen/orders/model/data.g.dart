// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    city_id: json['city_id'] as int?,
    total: (json['total'] as num?)?.toDouble(),
    status: json['status'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    total_with_vat: (json['total_with_vat'] as num?)?.toDouble(),
    delivery_price: (json['delivery_price'] as num).toDouble(),
    status_ar: json['status_ar'] as String?,
    carts: (json['carts'] as List<dynamic>)
        .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    payment_method: json['payment_method'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'city_id': instance.city_id,
      'total': instance.total,
      'total_with_vat': instance.total_with_vat,
      'created_at': instance.created_at?.toIso8601String(),
      'status': instance.status,
      'status_ar': instance.status_ar,
      'delivery_price': instance.delivery_price,
      'carts': instance.carts,
      'payment_method': instance.payment_method,
    };
