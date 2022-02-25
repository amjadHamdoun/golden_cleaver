import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/register/model/register_response.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      {required String name,
        required String mobile,
      required String email,
      // ignore: non_constant_identifier_names
      required String password_confirmation,
      required String password});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  RegisterRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, RegisterResponseModel>> register(

      {required String name,
        required String mobile,
      required String email,
        // ignore: non_constant_identifier_names
      required String password_confirmation,
      required String password}) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(Endpoints.Register,
            data: {
              'name': '$name',
              'mobile':'$mobile',
              'email': "$email",
              'password_confirmation': '$password_confirmation',
              'password': "$password"
            },
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            ));

        print(re);
        return Right(RegisterResponseModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
