import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final int? country_id;
  final int? area_id;
  final int? city_id;




  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,
    required this.name,
    required this.area_id,
    required this.country_id,
    required this.city_id


  });
}
