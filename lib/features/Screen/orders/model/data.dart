import 'package:json_annotation/json_annotation.dart';

import 'cart_model.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;
  final int? city_id;
  final double? total;
  final double? total_with_vat;
  final DateTime? created_at;
  final String? status;
  final String? status_ar;
  final double delivery_price;
  final List<CartModel> carts;
  final String? payment_method;





  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,
    required this.city_id,
    required this.total,
    required this.status,
    required this.created_at,
    required this.total_with_vat,
    required this.delivery_price,
    required this.status_ar,
    required this.carts,
    required this.payment_method,



  });
}




