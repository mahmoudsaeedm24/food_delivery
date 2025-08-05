import 'package:dio/dio.dart';
import 'package:food_delivery/core/errors/api_error_handler.dart';
import 'package:food_delivery/core/utils/network/dio/api_constants.dart';
import 'package:fpdart/fpdart.dart';

class AuthDataSource {
  late Dio _dio;
  AuthDataSource() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: ApiConstants.contentType,
      receiveTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 5),
    );

    _dio = Dio(options);
  }

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
