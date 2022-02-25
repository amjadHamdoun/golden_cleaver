import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/splash/model/settings_model.dart';





abstract class SettingsRemoteDataSource {
  Future<Either<String, SettingsModel>> getSettings();

}

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  SettingsRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future<Either<String, SettingsModel>> getSettings() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Settings,
        );
        print(re);
        return Right(SettingsModel.fromJson(json.decode(re.data)));
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
