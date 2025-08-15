import 'package:frontend/core/components/data/data_sources/product_data_source/product_data_source_local.dart';
import 'package:frontend/core/components/data/data_sources/product_data_source/product_data_source_online.dart';
import 'package:frontend/core/utils/repo_helper/convert_json_to_list.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/components/data/models/product/product_model.dart';
import '../../../../core/services/network_checker.dart';

class GetProductsRepo {
  final ProductDataSourceOnline _productDataSourceOnline;
  final ProductDataSourceLocal _productDataSourceLocal;
  final NetworkChecker _networkChecker;
  GetProductsRepo({
    required ProductDataSourceOnline productDataSourceOnline,
    required ProductDataSourceLocal productDataSourceLocal,
    required NetworkChecker networkChecker,
  }) : _productDataSourceOnline = productDataSourceOnline,
       _productDataSourceLocal = productDataSourceLocal,
       _networkChecker = networkChecker;

  Future<Either<Exception, List<ProductModel>>> getProductsByCategoryId({
    required String categoryId,
  }) async {
    try {
      //* return all products in deafult category
      if (categoryId == CategoryModel.defaultCategory().id) {
        return await _networkChecker.isConnected()
            ?
              ///* get online data if connected with internet
              await _getAllProductsOnline()
            :
              //* get stored data if it's problem with internet
              await _productDataSourceLocal.getAllProducts();

        //* return all products in the same category
        ///* we use categoryId as a marker to splitting products
      } else {
        return await _networkChecker.isConnected()
            ?
              ///* filter data from online data source if connected
              await _getProductsByCategoryIdOnline(categoryId)
            :
              ///* filter locally data when connection failed
              await _productDataSourceLocal.getProductsByCategoryId(categoryId);
      }
    } on Exception catch (e) {
      return left(e);
    }
  }

  Future<Either<Exception, List<ProductModel>>> _getProductsByCategoryIdOnline(
    String categoryId,
  ) async {
    final either = await _productDataSourceOnline.getProductsByCategoryId(
      categoryId,
    );
    return either.map((response) {
      final productsList = convertJsonToList(response, ProductModel.fromJson);
      return productsList;
    });
  }

  Future<Either<Exception, List<ProductModel>>> _getAllProductsOnline() async {
    final either = await _productDataSourceOnline.getAllProducts();
    return either.map<List<ProductModel>>((response) {
      // final productsJson = List<Map<String, dynamic>>.from(res.data);
      final productsList = convertJsonToList<ProductModel>(
        response,
        ProductModel.fromJson,
      );
      _productDataSourceLocal.storeProductsLocally(products: productsList);
      return productsList;
    });
  }
}
