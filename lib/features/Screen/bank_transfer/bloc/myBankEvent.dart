import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyBankEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class BankNameEvent extends MyBankEvents{

}

class GetCitiesEvent extends MyBankEvents{

}
class GetSectionsEvent extends MyBankEvents{

}

class GetMyLocationEvent extends MyBankEvents{

}
class ChangeTotalEvent extends MyBankEvents{
 String? total;
 String? totalWithVat;
 ChangeTotalEvent({this.total,this.totalWithVat});


}

class ChangeCityEvent extends MyBankEvents{
  int? cityId;
  String? cityName;
  double? deliveryPrice;
  ChangeCityEvent({this.cityId,this.cityName,this.deliveryPrice});


}
class ChangeHomeEvent extends MyBankEvents{
  String? home;
  ChangeHomeEvent({this.home,});


}
class ChangeBankEvent extends MyBankEvents{
  String? name;
  String? bank_id;
  String? account_number;
  ChangeBankEvent({this.name,
   this.account_number,
    this.bank_id
  });


}
class ChangeImageEvent extends MyBankEvents{
  File? image;

  ChangeImageEvent({
    this.image,

  });


}
class OrderEvent extends MyBankEvents{


}

class GetCartsEvent extends MyBankEvents {

}
class ChangeDescEvent extends MyBankEvents{
  String? desc;
  ChangeDescEvent({this.desc,});


}
class ChangeStreetEvent extends MyBankEvents{
  String? street;
  ChangeStreetEvent({this.street,});


}
class ChangeSectionEvent extends MyBankEvents{
  int? sectionId;
  String? sectionName;
  ChangeSectionEvent({this.sectionId,this.sectionName});


}

class ChangeLatLonEvent extends MyBankEvents{
  double? lat;
  double? lon;
  ChangeLatLonEvent({this.lat,this.lon});


}
class ResetEvent extends MyBankEvents{



}