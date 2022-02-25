import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {

  final int? code;
  final bool? statue;
  final Data? data;
  final String? message;

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  SettingsModel(
      {this.code, this.statue, this.message,
        required this.data,
      });
}