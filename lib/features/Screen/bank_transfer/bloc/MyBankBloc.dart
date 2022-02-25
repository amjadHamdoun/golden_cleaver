import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:golden_cleaver/features/Screen/add_address/api/city_remote.dart';
import 'package:golden_cleaver/features/Screen/add_address/api/section_remote.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/city/city_model.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/section/section_model.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/api/carts_remote.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/api/mybank_remote.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBankEvent.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/model/cart/cart_res_model.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/model/mybank_model.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';

import 'myBank_state.dart';


class MyBankBloc extends Bloc<MyBankEvents, MyBankState> {
  MyBankRemoteDataSource myBankRemoteDataSource;
  CityRemoteDataSource cityRemoteDataSource;
  SectionRemoteDataSource sectionRemoteDataSource;
  CartsRemoteDataSource cartsRemoteDataSource;

  MyBankBloc({
    required this.myBankRemoteDataSource,
    required this.cityRemoteDataSource,
    required this.sectionRemoteDataSource,
    required this.cartsRemoteDataSource
  }) : super(MyBankState.initial());

  void onMyBankGetEvent() {
    add(BankNameEvent(
    ));
  }
  void onResetEvent() {
    add(ResetEvent(
    ));
  }

  void onGetCitiesEvent() {
    add(GetCitiesEvent(
    ));
  }

  void onOrderEvent() {
    add(OrderEvent(
    ));
  }

  void onGetSectionsEvent() {
    add(GetSectionsEvent(
    ));
  }
  void onChangeImageEvent(File image) {
    add(ChangeImageEvent(
      image: image
    ));
  }
  void onGetCartsEvent() {
    add(GetCartsEvent(
    ));
  }
  void onGetMyLocationEvent() {
    add(GetMyLocationEvent(
    ));
  }
  void onChangeTotalEvent(String total,String totalWithVat) {
    add(ChangeTotalEvent(total: total,
      totalWithVat:totalWithVat
    ));
  }

  void onChangeBankEvent(String name,String account_number,String bank_id) {
    add(ChangeBankEvent(
      name: name,
      account_number: account_number,
      bank_id: bank_id
    ));
  }

  void onChangeLatLonEvent(double lat,double lon) {
    add(ChangeLatLonEvent(
      lat: lat,
      lon: lon
    ));
  }
  void onChangeDescEvent(String desc,) {
    add(ChangeDescEvent(
       desc: desc

    ));
  }
  void onChangeHomeEvent(String home,) {
    add(ChangeHomeEvent(
        home: home

    ));
  }
  void onChangStreetEvent(String street,) {
    add(ChangeStreetEvent(
        street: street

    ));
  }

  void onChangeCityEvent(int cityId , String cityName,double deliveryPrice) {
    add(ChangeCityEvent(
        cityId: cityId,
      cityName: cityName,
      deliveryPrice: deliveryPrice
    ));
  }
  void onChangeSectionEvent(int sectionId , String sectionName) {
    add(ChangeSectionEvent(
        sectionId: sectionId,
        sectionName: sectionName
    ));
  }


  @override
  Stream<MyBankState> mapEventToState(MyBankEvents event) async* {

    if (event is BankNameEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage = ''
        ..myBankModel = MyBankModel(data: [])
      );
      print("sss");
      final result = await myBankRemoteDataSource.getMyBank(
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');

        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..myBankModel = r
        );
      });
    }

    else if (event is GetCitiesEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage = ''
        ..cityModel = CityModel(data: [])
      );
      print("sss");
      final result = await cityRemoteDataSource.getCities(
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');

        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..cityModel = r
        );
      });
    }

    else if (event is GetSectionsEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage = ''
        ..sectionModel = SectionModel(data: [])
      );
      print("sss");
      final result = await     sectionRemoteDataSource.getSections(
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');

        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..sectionModel = r
        );
      });
    }

    else if (event is GetMyLocationEvent) {
      Location location = new Location();


      LocationData _locationData;


      _locationData = await location.getLocation();

      yield state.rebuild((b) =>
      b
        ..center = LatLng(_locationData.latitude!, _locationData.longitude!)

      );
    }

    else if (event is ChangeTotalEvent) {
      yield state.rebuild((b) =>
      b
        ..total = event.total
          ..totalWithVat=event.totalWithVat

      );
    }

    else if (event is ChangeLatLonEvent) {
      yield state.rebuild((b) =>
      b
        ..lat = event.lat
        ..lon=event.lon

      );
    }

    else if (event is ChangeCityEvent) {
      yield state.rebuild((b) => b
        ..cityId=event.cityId
        ..cityName=event.cityName
          ..deliveryPrice=event.deliveryPrice
      );
    }

    else if (event is ChangeSectionEvent) {
      yield state.rebuild((b) => b
        ..sectionId=event.sectionId
        ..sectionName=event.sectionName
      );
    }

    else if (event is ChangeHomeEvent) {
      yield state.rebuild((b) => b
        ..home=event.home

      );
    }

    else if (event is ChangeStreetEvent) {
      yield state.rebuild((b) => b
        ..street=event.street

      );
    }

    else if (event is ChangeDescEvent) {
      yield state.rebuild((b) => b
        ..description=event.desc

      );
    }

    else if (event is ChangeBankEvent) {
      yield state.rebuild((b) => b
        ..name=event.name
          ..account_number=event.account_number
          ..bank_id=event.bank_id

      );
    }

    else if (event is ResetEvent) {
      yield state.rebuild((b) => b
        ..lat=0
        ..lon=0
        ..cityId=0
        ..cityName=''
        ..sectionName=''
        ..sectionId=0
        ..home=''
        ..description=''
        ..street=''
          ..bank_id=''
          ..name=''
          ..account_number=''
        ..deliveryPrice=0
        ..carts=[]
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

    else if (event is ChangeImageEvent) {
      yield state.rebuild((b) => b
        ..image=event.image

      );
    }

    else  if (event is GetCartsEvent) {
      yield state.rebuild((b) => b
        ..carts=[]

      );

      var box = await Hive.openBox('cartBox');


      yield state.rebuild((b) => b
        ..carts=box.get('ca', defaultValue: <Basket>[]).cast<Basket>()

      );
      Hive.close();

    }

    else if (event is OrderEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoadingOrder = true
        ..isSuccessOrder = false
        ..errorMessage = ''

      );
      print("sss");
      final result = await     cartsRemoteDataSource.carts(
        state: state
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoadingOrder = false
          ..isSuccessOrder = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');

        yield state.rebuild((b) =>
        b
          ..isLoadingOrder = false
          ..isSuccessOrder = true
          ..errorMessage = ''
            ..cartResModel=r


        );
      });
    }


  }
}