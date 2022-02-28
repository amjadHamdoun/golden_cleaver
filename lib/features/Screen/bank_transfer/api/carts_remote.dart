import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/model/cart/cart_res_model.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket_model.dart';



abstract class CartsRemoteDataSource {
  Future<Either<String, CartResModel>> carts({required MyBankState state});

}

class CartsRemoteDataSourceImpl extends CartsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  CartsRemoteDataSourceImpl({required this.dio,required this.networkInfo});

  @override
  Future< Either<String, CartResModel>> carts({required MyBankState state}) async {

    if (await networkInfo.hasConnection) {
      List<BasketModel>  carts=[];
      for(var ca in state.carts!)
        {
          carts.add(BasketModel
            (id: ca.id, size_id: ca.size_id,
              price: ca.price, amount: ca.amount,
              addition_id: ca.addition_id));
          print(carts[0].toJson());
        }

      String fileName = '';
      if(state.image!=null)
        fileName =state.image!.path.split('/').last;
      var formData = FormData.fromMap({
        'user_id':Global.userId ,
        'cart': [
          for(var ca in carts)
            {
              "id": ca.id,
              "size_id": ca.size_id,
              "amount": ca.amount,
              "price": ca.price,
              "addition_id": [
                for(int i in ca.addition_id!)
                [i],
              ]
            },
        ],
        'total':state.total,
        'total_with_vat':state.totalWithVat,
        'vat_percentage':Global.tax ,
        'delivery':"1",
        'location_lat':state.lat,
        'location_lng':state.lon,
        'city_id':state.cityId,
        'section_id':state.sectionId,
        'home':state.home,
        'street':state.street,
        'place':"office",
        'payment_method':"transaction",
        "description":state.description,
        "delivery_price": state.deliveryPrice,
        "name": state.name,
        "bank_id": state.bank_id,
        "account_number": state.account_number,
        "image":
        await MultipartFile.fromFile(state.image!.path, filename:fileName),
      });


      try {
        final re = await dio.post(
          Endpoints.Carts,
          data: formData ,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            )
            );

        print(re);
        return Right(CartResModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        print(ex);
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        print(e);
        return Left(Er.error);
      }
    }
    else {
      return Left(Er.networkError);
    }





  }




}
