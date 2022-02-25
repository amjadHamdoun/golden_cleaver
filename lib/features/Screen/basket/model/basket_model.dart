import 'package:json_annotation/json_annotation.dart';




part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel {
   int? id;
  int? size_id;
  double? amount;
  double? price;


  List<int>? addition_id;


  Map<String, dynamic> toJson() => _$BasketModelToJson(this);
  factory BasketModel.fromJson(Map<String, dynamic> json) =>
      _$BasketModelFromJson(json);

   BasketModel(
      {
        required  this.id,
        required  this.size_id,
        required  this.price,
        required  this.amount,
        required  this.addition_id,

      });
}

