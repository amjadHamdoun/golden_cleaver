import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;
  // ignore: non_constant_identifier_names
  final double?tax_amount;

  // ignore: non_constant_identifier_names
  final int ?tax_num;




  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,
    required this.tax_amount,
    required this.tax_num,
  });
}
