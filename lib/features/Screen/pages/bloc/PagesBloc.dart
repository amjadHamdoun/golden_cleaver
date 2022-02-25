import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/api/notifications_remote.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/api/user_details_remote.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/data.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/user_model.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';

import 'package:golden_cleaver/features/Screen/category/api/category_remote.dart';
import 'package:golden_cleaver/features/Screen/category/model/category_model.dart';
import 'package:golden_cleaver/features/Screen/home/api/product_remote.dart';
import 'package:golden_cleaver/features/Screen/home/api/slider_remote.dart';
import 'package:golden_cleaver/features/Screen/home/model/product/product_model.dart';
import 'package:golden_cleaver/features/Screen/home/model/slider/slider_model.dart';
import 'package:golden_cleaver/features/Screen/orders/api/oders_remote.dart';
import 'package:golden_cleaver/features/Screen/orders/model/orders_model.dart';
import 'package:hive/hive.dart';
import 'PagesEvent.dart';
import 'pages_state.dart';


class PagesBloc extends Bloc<PagesEvents, PagesState> {
  UserDetailsRemoteDataSource userDetailsRemoteDataSource;
  SliderRemoteDataSource sliderRemoteDataSource;
  ProductRemoteDataSource productRemoteDataSource;
  CategoryRemoteDataSource categoryRemoteDataSource;
  NotificationRemoteDataSource notificationRemoteDataSource;
  OrdersRemoteDataSource ordersRemoteDataSource;

  PagesBloc({
    required this.userDetailsRemoteDataSource,
    required this.sliderRemoteDataSource,
    required this.categoryRemoteDataSource,
    required this.productRemoteDataSource,
    required this.notificationRemoteDataSource,
    required this.ordersRemoteDataSource
  }) : super(PagesState.initial());

  void onUserDetailsEvent() {
    add(UserDetailsEvent(
    ));
  }

  void onGetNotificationsEvent() {
    add(GetNotificationsEvent(
    ));
  }
  void onGetSlidersEvent() {
    add(GetSlidersEvent(
    ));
  }
  void onSetCartsEvent(List<Basket> carts) {
    add(SetCartsEvent(carts
    ));
  }
  void onAddCartsEvent(Basket cart) {
    add(AddCartsEvent(cart));
  }
  void onGetProductsEvent() {
    add(GetProductsEvent(
    ));
  }
  void onGetCartsEvent() {
    add(GetCartsEvent(
    ));
  }
  void onGetOrdersEvent() {
    add(GetOrdersEvent(
    ));
  }
  void onGetCategoriesEvent(bool api) {
    add(GetCategoriesEvent(api
    ));
  }

  @override
  Stream<PagesState> mapEventToState(PagesEvents event) async* {
    if (event is UserDetailsEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..userModel=UserModel(data: Data(
          email: '',
          name: '',
          photo: '',
        ))
      );
      final result = await userDetailsRemoteDataSource.userDetails(

      );
        print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {

        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
            ..userModel=r
          );
      });
    }

    else  if (event is GetSlidersEvent) {
      yield state.rebuild((b) => b
        ..isLoadingSlider = true
        ..isSuccessSlider = false
        ..errorMessage=''
          ..sliderModel=SliderModel(data: [])

      );
      final result = await sliderRemoteDataSource.getSliders(

      );
      print("result");
      print(result);
      print("result");
      yield* result.fold(
              (l) async* {
        yield state.rebuild((b) => b
          ..isLoadingSlider = false
          ..isSuccessSlider = false
          ..errorMessage = l);
      }, (r) async* {

        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoadingSlider = false


          ..errorMessage = ''
          ..sliderModel=r
        );
      });
    }

    else  if (event is GetProductsEvent) {
      yield state.rebuild((b) => b
        ..isLoadingSlider = true
        ..isSuccessSlider = false
        ..errorMessage=''
        ..productModel=ProductModel(data: [])

      );
      final result = await productRemoteDataSource.getProducts(

      );
      print("result");
      print(result);
      print("result");
      yield* result.fold(
              (l) async* {
            yield state.rebuild((b) => b
              ..isLoadingSlider = false
              ..isSuccessSlider = false
              ..errorMessage = l);
          }, (r) async* {

        print('sucesss');
        print(r.data!.length);
        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoadingSlider = false
          ..isSuccessSlider = true
          ..errorMessage = ''
          ..productModel=r
        );
      });
    }

    else  if (event is GetCategoriesEvent) {
      if(event.api||state.categoryModel!.data!.length==0)
        {
          yield state.rebuild((b) => b
            ..isLoadingSlider = true
            ..isSuccessSlider = false
            ..errorMessage=''
            ..categoryModel=CategoryModel(data: [])

          );
          final result = await categoryRemoteDataSource.getCategories(

          );
          print("result");
          print(result);
          print("result");
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingSlider = false
                  ..isSuccessSlider = false
                  ..errorMessage = l);
              }, (r) async* {

            print('sucesss');
            print(r.data!.length);
            print('sucesss');

            yield state.rebuild((b) => b
              ..isLoadingSlider = false
              ..isSuccessSlider = true
              ..errorMessage = ''
              ..categoryModel=r
            );
          });
        }


    }

    else  if (event is GetOrdersEvent) {
      yield state.rebuild((b) => b
        ..isLoadingOrders = true
        ..isSuccessOrders  = false
        ..errorMessage=''
          ..orderModel=OrderModel(data: [])


      );
      final result = await ordersRemoteDataSource.orders(

      );
      print("result");
      print(result);
      print("result");
      yield* result.fold(
              (l) async* {
            yield state.rebuild((b) => b
              ..isLoadingOrders = false
              ..isSuccessOrders  = false
              ..errorMessage = l);
          }, (r) async* {

        print('sucesss');
        print(r.data!.length);
        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoadingOrders = false
          ..isSuccessOrders  = true
          ..errorMessage = ''
            ..orderModel=r

        );
      });
    }

    else  if (event is GetNotificationsEvent) {
      yield state.rebuild((b) => b
        ..errorMessage=''
        ..notificationModel=NotificationModel(data: [])
      );
      final result = await notificationRemoteDataSource.getNotification();

      yield* result.fold(
              (l) async* {
            yield state.rebuild((b) => b
              ..errorMessage = l);
          }, (r) async* {

        yield state.rebuild((b) => b
          ..errorMessage = ''
          ..notificationModel=r
        );
      });
    }

    else  if (event is GetCartsEvent) {

      yield state.rebuild((b) => b
        ..isLoadingBasket = true
        ..isSuccessBasket  = false
        ..errorMessage=''
        ..carts=[]

      );

      var box = await Hive.openBox('cartBox');
      print("result");

      print("result");

      yield state.rebuild((b) => b
        ..isLoadingBasket = true
        ..isSuccessBasket  = false
        ..errorMessage=''
        ..carts=box.get('ca', defaultValue: <Basket>[]).cast<Basket>()

      );
      Hive.close();

    }



    else  if (event is SetCartsEvent) {
      yield state.rebuild((b) => b
        ..errorMessage = '');
      var box = await Hive.openBox('cartBox');
      await box.put('ca', event.carts);
      yield state.rebuild((b) => b
        ..carts=box.get('ca', defaultValue: <Basket>[]).cast<Basket>()
      );
      Hive.close();
    }

    else  if (event is AddCartsEvent) {
      yield state.rebuild((b) => b
        ..errorMessage = '');
      print('add');
      print('dadad');
      var box = await Hive.openBox('cartBox');
      List<Basket>? listCarts=box.get('ca', defaultValue: <Basket>[]).cast<Basket>();
      if(listCarts==null)
        {
          listCarts=[];
        }
      listCarts.add(event.cart!);
      await box.put('ca', listCarts);
      print('add');
      yield state.rebuild((b) => b
        ..carts=box.get('ca', defaultValue: <Basket>[]).cast<Basket>()
      );
      Hive.close();
    }


  }
}
