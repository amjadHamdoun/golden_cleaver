
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:golden_cleaver/core/utils/constants.dart';

import '../../../../Globals.dart';

abstract class AddCommentRemoteDataSource {
  Future<Either<String, String>> addComment(int productId,String content);

}

class AddCommentRemoteDataSourceImpl extends AddCommentRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  AddCommentRemoteDataSourceImpl({
    required this.dio,
    required this.networkInfo});

  @override
  Future<Either<String, String>> addComment(int productId,String content) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
            Endpoints.AddComment,
            data: {
              'user_id':Global.userId,
              'product_id':productId,
              'content':content
            }
        );
        print(re);
        return Right('succ');
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