import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {

    final List<Data>? data;


  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

   CategoryModel(
      {
        required  this.data,

      });
}
