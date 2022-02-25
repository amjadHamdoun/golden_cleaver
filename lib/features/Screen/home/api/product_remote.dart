import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/home/model/product/product_model.dart';
import 'package:golden_cleaver/features/Screen/home/model/slider/slider_model.dart';

import '../../MyAccount/model/user_model.dart';


abstract class ProductRemoteDataSource {
  Future<Either<String, ProductModel>> getProducts();

}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  ProductRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, ProductModel>> getProducts() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Products,

            );

        print(re);
        return Right(ProductModel.fromJson(json.decode(re.data)));
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
