import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import '../model/user_model.dart';


abstract class UserUpdateRemoteDataSource {
  Future<Either<String, UserModel>> userUpdate(
      {required String name,required  String email,required String city,
        required String mobile});

}

class UserUpdateRemoteDataSourceImpl extends UserUpdateRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  UserUpdateRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, UserModel>> userUpdate(
      {required String name, required String email,
        required String city, required String mobile})async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
          Endpoints.UserUpdate+'/'+Global.userId.toString(),
          data: {
            'name':name,
            'email':email,
            'mobile':mobile
          }
            );

        print(re);
        return Right(UserModel.fromJson(json.decode(re.data)));
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
