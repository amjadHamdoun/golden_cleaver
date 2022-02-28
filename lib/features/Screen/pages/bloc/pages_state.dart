

import 'package:built_value/built_value.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/data.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/user_model.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';
import 'package:golden_cleaver/features/Screen/category/model/category_model.dart';
import 'package:golden_cleaver/features/Screen/home/model/product/product_model.dart';
import 'package:golden_cleaver/features/Screen/home/model/slider/slider_model.dart';
import 'package:golden_cleaver/features/Screen/orders/model/orders_model.dart';




part 'pages_state.g.dart';


  abstract class PagesState implements Built<PagesState, PagesStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  bool? get isSuccessOrders;

  bool? get isLoadingOrders;

  bool? get isLoadingSlider;

  bool? get isSuccessSlider;

  bool? get isLoadingCate;

  bool? get isSuccessCate;

  bool? get isLoadingBasket;

  bool? get isSuccessBasket;
  OrderModel? get orderModel;

  String? get errorMessage;
  UserModel? get userModel;
  SliderModel? get sliderModel;
  ProductModel? get productModel;
  CategoryModel? get categoryModel;
  NotificationModel? get notificationModel;
  List<Basket>? get carts;


  PagesState._();

  factory PagesState([void Function(PagesStateBuilder) updates]) = _$PagesState;

  factory PagesState.initial() {
    return PagesState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingSlider = false
      ..isSuccessSlider = false
      ..isLoadingCate = false
      ..isSuccessCate  = false
      ..isLoadingBasket = false
      ..isSuccessBasket = false
      ..isSuccessOrders=false
      ..isLoadingOrders=false
      ..orderModel=OrderModel(data: [])

      ..productModel=ProductModel(data: [])
      ..sliderModel=SliderModel(data: [])
      ..categoryModel=CategoryModel(data: [])
      ..errorMessage = ''
      ..carts=[]
      ..userModel=UserModel(data: UserData(
          email: '',
          name: '',
          mobile: '',

        ))
        ..notificationModel=NotificationModel(data: [])






      );
  }
}
