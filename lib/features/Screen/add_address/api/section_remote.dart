import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/core/utils/constants.dart';
import 'package:golden_cleaver/features/Screen/add_address/model/section/section_model.dart';





abstract class SectionRemoteDataSource {
  Future<Either<String, SectionModel>> getSections();

}

class SectionRemoteDataSourceImpl extends SectionRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  SectionRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future<Either<String, SectionModel>> getSections() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.Sections,
        );
        print(re);
        return Right(SectionModel.fromJson(json.decode(re.data)));
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
