import 'package:fpdart/fpdart.dart';

import '../../../../core/components/data/models/product/product_model.dart';

abstract class GetProductsInterface {
  Future<Either<Exception, List<ProductModel>>> getProductsByCategoryId ();


}
