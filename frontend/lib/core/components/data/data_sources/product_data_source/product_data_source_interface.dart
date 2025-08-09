import 'package:fpdart/fpdart.dart';

abstract class ProductDataSourceInterface {
  Future<Either<Exception, dynamic>> getAllProducts();

  Future<Either<Exception, dynamic>> getProductsByCategoryId(String categoryId);

  Future<Either<Exception, dynamic>> getProductsContain(String name);
}
