import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'city_model.g.dart';

@JsonSerializable()
class CityModel {

  List<CityData>? data;


  Map<String, dynamic> toJson() => _$CityModelToJson(this);
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  CityModel(
      {
        required this.data,
      });
}