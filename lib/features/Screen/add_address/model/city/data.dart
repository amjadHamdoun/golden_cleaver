import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final double? delivery_price;
  final int? country_id;




  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,
    required this.name,
    required this.delivery_price,
    required this.country_id,


  });
}
