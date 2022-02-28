import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class UserData {


  final String? name;
  final String? email;
  final String? mobile;


  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  UserData(
      {
        required  this.name,
        required  this.email,
        required  this.mobile,

      });
}
