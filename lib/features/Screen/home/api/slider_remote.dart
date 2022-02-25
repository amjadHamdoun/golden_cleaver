import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/home/model/slider/slider_model.dart';

import '../../MyAccount/model/user_model.dart';


abstract class SliderRemoteDataSource {
  Future<Either<String, SliderModel>> getSliders();

}

class SliderRemoteDataSourceImpl extends SliderRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  SliderRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, SliderModel>> getSliders() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Sliders,

            );

        print(re);
        return Right(SliderModel.fromJson(json.decode(re.data)));
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
