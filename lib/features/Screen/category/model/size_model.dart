import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'size_model.g.dart';

@JsonSerializable()
class SizeModel {

  final int? id;
  final String? name;
  final double? price;
  final double? old_price;
  final String? image;
  final String? description;
  final int? grams_enabled;



  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);

  SizeModel(
      {
        required  this.id,
        required  this.name,
        required  this.price,
        required  this.old_price,
        required this.description,
        required this.grams_enabled,
        required this.image
      });
}
