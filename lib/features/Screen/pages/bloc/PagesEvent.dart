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




