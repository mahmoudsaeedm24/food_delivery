import 'package:dio/dio.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_interface.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../errors/api_error_handler.dart';
import '../../../../utils/network/dio/api_constants.dart';

class UserDataSourceOnline extends UserDataSourceInterface{
  final Dio _dio;

  UserDataSourceOnline({required Dio dio}) : _dio = dio;

  Future<Either<Exception, Response>> getUserInfo() async {
    try {
      final res = await _dio.get(Pathes.userPath);
      return right(res);
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        return left(ApiErrorHandler.handle(status));
      } else {
        return left(Exception('❌ Connection error: ${e.message}'));
      }
    } on Exception catch (e) {
      return left(e);
    }
  }

  Future<Either<Exception, Response>> updateUser(
    Map<String, dynamic> updatedUser,
  ) async {
    try {
      final res = await _dio.post(
        Pathes.userPath,
        queryParameters: updatedUser,
      );
      return right(res);
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        return left(ApiErrorHandler.handle(status));
      } else {
        return left(Exception('❌ Connection error: ${e.message}'));
      }
    } on Exception catch (e) {
      return left(e);
    }
  }
}
