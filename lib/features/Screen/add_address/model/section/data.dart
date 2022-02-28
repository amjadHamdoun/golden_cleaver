import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class SectionData {
  final int? id;
  final String? name;
  final int? country_id;
  final int? area_id;
  final int? city_id;




  Map<String, dynamic> toJson() => _$SectionDataToJson(this);

  factory SectionData.fromJson(Map<String, dynamic> json) => _$SectionDataFromJson(json);

  SectionData({
    required this.id,
    required this.name,
    required this.area_id,
    required this.country_id,
    required this.city_id


  });
}
