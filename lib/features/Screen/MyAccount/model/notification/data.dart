import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {

  int? id;
  final int? seen;
  final String? url;
  final String? content;


  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.id,
        required  this.seen,
        required  this.url,
        required  this.content,
      });
}
