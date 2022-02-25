import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/city/city_model.dart';





abstract class CityRemoteDataSource {
  Future<Either<String, CityModel>> getCities();

}

class CityRemoteDataSourceImpl extends CityRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  CityRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future<Either<String, CityModel>> getCities() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Cities,
        );
        print(re);
        return Right(CityModel.fromJson(json.decode(re.data)));
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
