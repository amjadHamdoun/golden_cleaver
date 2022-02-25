import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'orders_model.g.dart';

@JsonSerializable()
class OrderModel {

  List<Data>? data;


  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  OrderModel(
      {
        required this.data,
      });
}