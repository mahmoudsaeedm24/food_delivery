import 'package:frontend/core/components/data/data_sources/product_data_source/product_data_source_local.dart';
import 'package:frontend/core/components/data/data_sources/product_data_source/product_data_source_online.dart';
import 'package:frontend/core/utils/repo_helper/convert_json_to_list.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/components/data/models/product/product_model.dart';
import '../../../../core/services/network_checker.dart';

class GetRecommendedProductsRepo {
  final ProductDataSourceOnline _productDataSource;
  final ProductDataSourceLocal _productDataSourceLocal;
  final NetworkChecker _networkChecker;

  GetRecommendedProductsRepo({
    required ProductDataSourceOnline productDataSource,
    required ProductDataSourceLocal productDataSourceLocal,
    required NetworkChecker networkChecker,
  }) : _productDataSource = productDataSource,
       _productDataSourceLocal = productDataSourceLocal,
       _networkChecker = networkChecker;

  Future<Either<Exception, List<ProductModel>>> getRecommenedProducts() async {
    if (await _networkChecker.isConnected()) {
      final either = await _productDataSource.getAllProducts();
      return either.map<List<ProductModel>>((response) {
        final allProducts = convertJsonToList(response, ProductModel.fromJson);
        return allProducts;
      });
    } else {
      return await _productDataSourceLocal.getAllProducts();
    }
  }
}
