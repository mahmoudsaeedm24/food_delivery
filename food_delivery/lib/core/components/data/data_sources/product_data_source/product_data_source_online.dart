import 'package:dio/dio.dart';
import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_interface.dart';
import 'package:food_delivery/core/errors/api_error_handler.dart';
import 'package:food_delivery/core/utils/network/dio/api_constants.dart';
import 'package:fpdart/fpdart.dart';

final description =
    "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.";

// final List<ProductModel> products = [
//   ProductModel(
//     id: "1",
//     categoryId: "1",
//     title: "Ordinary Burgers",
//     price: 1,
//     poster: "assets/images/burger.jpg",
//     rating: 4.9,
//     images: [
//       "assets/images/burger.jpg",
//       "assets/images/burger2.jpg",
//       "assets/images/burger3.jpg",
//       "assets/images/iamge2.jpg",
//     ],
//     description: description,
//   ),
//   ProductModel(
//     id: "2",
//     categoryId: "1",
//     title: "Ordinary Burgers",
//     price: 2,
//     poster: "assets/images/burger.jpg",
//     rating: 4.9,
//     images: [
//       "assets/images/burger.jpg",
//       "assets/images/burger2.jpg",
//       "assets/images/burger3.jpg",
//       "assets/images/iamge2.jpg",
//     ],
//     description: description,
//   ),
//   ProductModel(
//     id: "3",
//     categoryId: "1",
//     title: "Ordinary Burgers",
//     price: 3,
//     poster: "assets/images/burger.jpg",
//     rating: 4.9,
//     images: [
//       "assets/images/burger.jpg",
//       "assets/images/burger2.jpg",
//       "assets/images/burger3.jpg",
//       "assets/images/iamge2.jpg",
//     ],
//     description: description,
//   ),
//   ProductModel(
//     id: "4",
//     categoryId: "2",
//     title: "Ordinary Burgers",
//     price: 4,
//     poster: "assets/images/burger.jpg",
//     rating: 4.9,
//     images: [
//       "assets/images/burger.jpg",
//       "assets/images/burger2.jpg",
//       "assets/images/burger3.jpg",
//       "assets/images/iamge2.jpg",
//     ],
//     description: description,
//   ),
// ];

class ProductDataSourceOnline extends ProductDataSourceInterface{
  final Dio _dio;

  ProductDataSourceOnline({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Exception, Response>> getAllProducts() async {
    try {
      final Response res = await _dio.get(Pathes.productsPath);
      return right(res);
    } on DioException catch (e) {
      return left(ApiErrorHandler.handle(e.response?.statusCode));
    } catch (e) {
      return left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response>> getProductsByCategoryId(
    String categoryId,
  ) async {
    try {
      final Response res = await _dio.get(
        Pathes.productsPath,
        queryParameters: {'categoryId': categoryId},
        options: Options(),
      );

      return right(res);
    } on DioException catch (e) {
      return left(ApiErrorHandler.handle(e.response?.statusCode));
    } catch (e) {
      return left(Exception("Error in productsWithId $e"));
    }
  }

  ///* filter products which name input in search
  @override
  Future<Either<Exception, Response>> getProductsContain(String name) async {
    try {
      final Response res = await _dio.get(
        Pathes.productsPath,
        queryParameters: {'productTitle': name},
      );
      return right(res);
    } on DioException catch (e) {
      return left(ApiErrorHandler.handle(e.response?.statusCode));
    } catch (e) {
      return left(Exception("Error in productsWithId $e"));
    }
  }
}
