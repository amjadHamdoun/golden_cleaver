import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'addition_model.g.dart';

@JsonSerializable()
class AdditionModel {

  final int? id;
  final String? name;
  final double? price;
  final double? old_price;


  Map<String, dynamic> toJson() => _$AdditionModelToJson(this);
  factory AdditionModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionModelFromJson(json);

  AdditionModel(
      {
        required  this.id,
        required  this.name,
        required  this.price,
        required  this.old_price,

      });
}
