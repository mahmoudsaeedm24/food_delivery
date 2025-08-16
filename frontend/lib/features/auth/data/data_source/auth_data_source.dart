import 'package:dio/dio.dart';
import 'package:frontend/core/errors/api_error_handler.dart';
import 'package:frontend/core/utils/network/dio/api_constants.dart';
import 'package:fpdart/fpdart.dart';

class AuthDataSource {
  final Dio _dio;

  AuthDataSource({required Dio dio}) : _dio = dio;
  

  Future<Either<Exception, Response>> login(Map userJson) async {
    try {
      final res = await _dio.post(Pathes.loginPath, data: userJson);

      return right(res);
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        return left(ApiErrorHandler.handle(status));
      } else {
        return left(Exception('❌ Connection error: ${e.message}'));
      }
    } catch (e) {
      return left(Exception('❌ Unexpected error: $e'));
    }
  }

  Future<Either<Exception, Unit>> signup(Map userJson) async {
    try {
      await _dio.post(Pathes.signupPath, data: userJson);
      return right(unit);
    } on DioException catch (e) {
      if (e.response != null) {
        final status = e.response?.statusCode;
        return left(ApiErrorHandler.handle(status));
      } else {
        return left(Exception('❌ Connection error: ${e.message}'));
      }
    } catch (e) {
      return left(Exception('❌ Unexpected error: $e'));
    }
  }
}
