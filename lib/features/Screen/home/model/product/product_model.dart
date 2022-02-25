import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {

   List<Data>? data;


  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

   ProductModel(
      {
        required  this.data,
      });
}
