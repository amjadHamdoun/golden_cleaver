import 'package:json_annotation/json_annotation.dart';

part 'size_model.g.dart';

@JsonSerializable()
class SizeModel {
  final int? id;
  final double? price;
  final String? name;



  Map<String, dynamic> toJson() => _$SizeModelToJson(this);

  factory SizeModel.fromJson(Map<String, dynamic> json) => _$SizeModelFromJson(json);

  SizeModel({
    required this.id,
    required this.price,
    required this.name,




  });
}




