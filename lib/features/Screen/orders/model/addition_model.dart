import 'package:json_annotation/json_annotation.dart';

part 'addition_model.g.dart';

@JsonSerializable()
class AdditionModel {
  final int? id;
  final double? price;
  final String? name;



  Map<String, dynamic> toJson() => _$AdditionModelToJson(this);

  factory AdditionModel.fromJson(Map<String, dynamic> json) => _$AdditionModelFromJson(json);

  AdditionModel({
    required this.id,
    required this.price,
    required this.name,




  });
}




