import 'package:fpdart/fpdart.dart';

abstract class CategoryDataSourceInterface {
  Future<Either<Exception, dynamic>> getAllCategories();
}
