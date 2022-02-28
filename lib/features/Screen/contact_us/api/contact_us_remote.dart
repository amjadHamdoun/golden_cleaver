import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/city/city_model.dart';





abstract class ContactUsRemoteDataSource {
  Future<Either<String, String>> contactUs(
  {
 required String name,
    required String phone,
    required String address,
    required String content
}
      );

}

class ContactUsRemoteDataSourceImpl extends ContactUsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  ContactUsRemoteDataSourceImpl({
    required this.dio, required this.networkInfo});

  @override
  Future<Either<String, String>> contactUs(
      {
        required String name,
        required String phone,
        required String address,
        required String content
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
          Endpoints.ContactUs,
          data: {
            'name':name,
            'email':phone,
            'title':address,
            'content':content,

          }
        );
        print(re.data);

        return Right('Succ');
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.error);
      } catch (e) {
        return Left(e.toString());
      }
    }
    else {
      return Left(Er.networkError);
    }





  }




}
