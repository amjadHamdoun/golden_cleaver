import 'package:golden_cleaver/features/Screen/category/model/size_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'addition_model.dart';
import 'data.dart';


part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {

  final int? id;
  final String? name;
  final String? image;
  final String? content;
  List<SizeModel> sizes;
  List<AdditionModel> additions;


  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductModel(
      {
        required  this.id,
        required  this.name,
        required  this.image,
        required  this.content,
        required  this.sizes,
        required  this.additions,

      });
}
