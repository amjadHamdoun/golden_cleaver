import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {

  List<SectionData>? data;


  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  SectionModel(
      {
        required this.data,
      });
}