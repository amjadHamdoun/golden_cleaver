import 'package:golden_cleaver/features/Screen/add_address/model/city/data.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/section/data.dart';
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
  final SectionData section;
  final String? payment_method;
  final String? home;
  final String? description;
  final String? street;
    final CityData city;



  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data( {
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
    required this.home,
    required this.street,
    required this.city,
    required this.description,
    required this.section,



  });
}




