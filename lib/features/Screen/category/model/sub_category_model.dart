import 'package:golden_cleaver/features/Screen/category/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';


@JsonSerializable()
class SubCategoryModel {
  final int? id;
  final String? name;
  final String? image;
  final String? content;
  final List<ProductModel>? products;

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

   SubCategoryModel(
      {
        required  this.id,
        required  this.name,
        required  this.image,
        required  this.content,
        required  this.products,

      });
}
