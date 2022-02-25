import 'package:golden_cleaver/features/Screen/category/model/addition_model.dart';
import 'package:golden_cleaver/features/Screen/category/model/size_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {


  final int? id;
  final String? name;
  final String? image;
  final String? content;
  List<SizeModel> sizes;
  List<AdditionModel> additions;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.id,
        required  this.name,
        required  this.image,
        required  this.content,
        required  this.sizes,
        required  this.additions,
      });
}
