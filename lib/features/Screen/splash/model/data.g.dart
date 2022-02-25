// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    tax_amount: (json['tax_amount'] as num?)?.toDouble(),
    tax_num: json['tax_num'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'tax_amount': instance.tax_amount,
      'tax_num': instance.tax_num,
    };
