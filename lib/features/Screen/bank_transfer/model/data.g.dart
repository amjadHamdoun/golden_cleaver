// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    bank_name: json['bank_name'] as String?,
    account_num: json['account_num'] as String?,
    Iban: json['Iban'] as String?,
    user_name: json['user_name'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.user_name,
      'bank_name': instance.bank_name,
      'account_num': instance.account_num,
      'Iban': instance.Iban,
    };
