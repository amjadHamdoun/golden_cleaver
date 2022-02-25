

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/city/city_model.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/section/section_model.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/model/cart/cart_res_model.dart';

import 'package:golden_cleaver/features/Screen/bank_transfer/model/mybank_model.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'myBank_state.g.dart';


abstract class MyBankState implements Built<MyBankState, MyBankStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessOrder;
  bool? get isLoadingOrder;
  File? get image;
  String? get errorMessage;
  double? get lat;
  double? get lon;
  double? get deliveryPrice;
  MyBankModel? get myBankModel;
  CityModel? get cityModel;
  SectionModel? get sectionModel;
  LatLng? get center;
  String? get total;
  String? get totalWithVat;
  String? get cityName;
  int? get cityId;
  String? get sectionName;
  int? get sectionId;
  String? get home;
  String? get street;
  String? get description;
  String? get name;
  String? get account_number;
  String? get bank_id;
  List<Basket>? get carts;
  CartResModel? get cartResModel;



  MyBankState._();

  factory MyBankState([void Function(MyBankStateBuilder) updates]) = _$MyBankState;

  factory MyBankState.initial() {
    return MyBankState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingOrder = false
      ..isSuccessOrder  = false
      ..myBankModel=MyBankModel(data: [])
      ..errorMessage = ''
      ..cityModel=CityModel(data: [])
        ..total='0'
        ..totalWithVat='0'
        ..lat=0
        ..lon=0
        ..center=LatLng(21.437273, 40.512714)
        ..sectionModel=SectionModel(data: [])
        ..cityId=0
        ..cityName=''
        ..sectionName=''
        ..sectionId=0
        ..home=''
        ..description=''
        ..street=''
        ..deliveryPrice=0
        ..carts=[]
        ..name=''
        ..account_number=''
        ..bank_id=''
      ..cartResModel=CartResModel(
        code: 0,
        status: false
      )
        ..image=File(
          ''
        )

    );
  }
}


