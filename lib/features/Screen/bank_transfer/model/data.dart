import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;

  final String? user_name;
  final String? bank_name;
  final String? account_num;
  final String? Iban;




  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,

    required this.bank_name,
    required this.account_num,
    required this.Iban,
    required this.user_name


  });
}
