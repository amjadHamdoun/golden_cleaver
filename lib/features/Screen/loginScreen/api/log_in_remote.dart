import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';


import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import '../model/login_response.dart';


abstract class LogInRemoteDataSource {
  Future<Either<String, LoginResponseModel>> logIn({required String email,required String password});

}

class LogInRemoteDataSourceImpl extends LogInRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  LogInRemoteDataSourceImpl({required this.dio,required this.networkInfo});

  @override
  Future< Either<String, LoginResponseModel>> logIn({required  String email,required String password}) async {

    if (await networkInfo.hasConnection) {
      try {
        String? token = await FirebaseMessaging.instance.getToken();
        final re = await dio.post(
          Endpoints.Login,
          data: {'email': "$email",
            'password': "$password",
            "fcm_token" :"$token"
          },
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            )
            );

        print(re);
        return Right(LoginResponseModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
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
