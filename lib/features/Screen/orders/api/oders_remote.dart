import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/model/mybank_model.dart';
import 'package:golden_cleaver/features/Screen/orders/model/orders_model.dart';




abstract class OrdersRemoteDataSource {
  Future<Either<String, OrderModel>> orders();

}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  OrdersRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future<Either<String, OrderModel>> orders() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Orders,
          queryParameters: {
            'api_token':Global.userToken
          }
        );
        print(re);
        return Right(OrderModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    }
    else {
      return Left(Er.networkError);
    }





  }




}
