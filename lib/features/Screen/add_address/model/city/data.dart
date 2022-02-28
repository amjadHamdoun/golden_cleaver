import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class CityData {
  final int? id;
  final String? name;
  final double? delivery_price;
  final int? country_id;




  Map<String, dynamic> toJson() => _$CityDataToJson(this);

  factory CityData.fromJson(Map<String, dynamic> json) => _$CityDataFromJson(json);

  CityData({
    required this.id,
    required this.name,
    required this.delivery_price,
    required this.country_id,


  });
}
