import 'package:dio/dio.dart';
import 'package:frontend/core/components/data/data_sources/category_data_source/category_data_source_interface.dart';
import 'package:frontend/core/errors/api_error_handler.dart';
import 'package:frontend/core/utils/network/dio/api_constants.dart';
import 'package:fpdart/fpdart.dart';

class CategoryDataSourceOnline extends CategoryDataSourceInterface {
  final Dio _dio;

  CategoryDataSourceOnline({required Dio dio}) : _dio = dio;
  @override
  Future<Either<Exception, Response>> getAllCategories() async {
    try {
      // log("${_dio.interceptors.first.runtimeType}");
      // log("${_dio.interceptors.last.runtimeType}");
      final Response res = await _dio.get(Pathes.categoriesPath);
      // log("res = $res");
      return right(res);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        return left(ApiErrorHandler.handle(statusCode));
      } else {
        return left(Exception("Error happend without source"));
      }
    } catch (e) {
      return left(Exception("Expection not expected check your code"));
    }
  }
}
