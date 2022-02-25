import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {


  final String? slider_firest_title;
  final String? slider_second_title;
  final String? slider_image;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.slider_firest_title,
        required  this.slider_second_title,
        required  this.slider_image,
      });
}
