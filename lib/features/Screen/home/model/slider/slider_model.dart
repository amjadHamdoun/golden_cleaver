import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {

   List<Data>? data;


  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  SliderModel(
      {
        required  this.data,
      });
}
