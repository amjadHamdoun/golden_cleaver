import 'package:golden_cleaver/features/Screen/category/model/size_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'addition_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final int? id;
  final String? name;
  final double? total;
  final int? amount;
  final SizeModel? size;
  final List<AdditionModel>? additions;



  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  CartModel({
    required this.id,
    required this.amount,
    required this.total,
    required this.size,
    required this.additions,
  required this.name,



  });
}




