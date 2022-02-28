import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {

  final int? id;
  final String? api_token;
  final String? name;


  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.api_token,
        required  this.id,
        required this.name

      });
}
