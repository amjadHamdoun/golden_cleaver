import 'package:equatable/equatable.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';

import 'package:meta/meta.dart';

@immutable
abstract class PagesEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class UserDetailsEvent extends PagesEvents {

}
class GetSlidersEvent extends PagesEvents {

}
class GetProductsEvent extends PagesEvents {

}
class GetCategoriesEvent extends PagesEvents {
bool api;
GetCategoriesEvent(this.api);
}
class GetOrdersEvent extends PagesEvents {

}

class GetCartsEvent extends PagesEvents {

}
class GetNotificationsEvent extends PagesEvents {

}

// ignore: must_be_immutable
class AddCartsEvent extends PagesEvents {
  Basket? cart;
  AddCartsEvent(this.cart);
}

// ignore: must_be_immutable
class SetCartsEvent extends PagesEvents {
   List<Basket> carts;
   SetCartsEvent(this.carts);
}
// ignore: must_be_immutable
class AddCommentEvent extends PagesEvents {
   int productId;
   String content;
  AddCommentEvent({required this.content,required this.productId});
}
// ignore: must_be_immutable
class UpdateUserEvent extends PagesEvents {
  String name;
  String email;
  String city;
  String mobile;
  UpdateUserEvent({
    required this.name,
    required this.email,
    required this.city,
    required this.mobile,

  });
}

// ignore: must_be_immutable
class ContactUsEvent extends PagesEvents {
  String name;
  String address;
  String content;
  String phone;
  ContactUsEvent({
    required this.name,
    required this.address,
    required this.content,
    required this.phone,

  });
}

