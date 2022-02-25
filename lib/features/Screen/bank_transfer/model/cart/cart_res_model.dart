import 'package:json_annotation/json_annotation.dart';



part 'cart_res_model.g.dart';

@JsonSerializable()
class CartResModel {

  int? code;
  bool? status;


  Map<String, dynamic> toJson() => _$CartResModelToJson(this);
  factory CartResModel.fromJson(Map<String, dynamic> json) =>
      _$CartResModelFromJson(json);

  CartResModel(
      {
        required this.code,
        required this.status,
      });
}
