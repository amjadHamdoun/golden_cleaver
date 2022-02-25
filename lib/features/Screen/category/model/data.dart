import 'package:golden_cleaver/features/Screen/category/model/sub_category_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {


  final int? id;
  final String? name;
  final String? image;
  final String? content;
  final List<SubCategoryModel>? sub_categories;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.id,
        required  this.name,
        required  this.image,
        required  this.content,
        required  this.sub_categories,
      });
}
