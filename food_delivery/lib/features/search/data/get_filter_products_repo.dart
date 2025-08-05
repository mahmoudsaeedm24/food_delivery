import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_local.dart';
import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_online.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/utils/repo_helper/convert_json_to_list.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/utils/network/network_checker.dart';

class GetFilterProductsRepo {
  final ProductDataSourceOnline _online;
  final ProductDataSourceLocal _local;
  final NetworkChecker _networkChecker;

  GetFilterProductsRepo({
    required ProductDataSourceOnline online,
    required ProductDataSourceLocal local,
    required NetworkChecker networkChecker
  }) : _online = online,
       _local = local, _networkChecker = networkChecker;

  Future<Either<Exception, List<ProductModel>>> getProductsContain({
    required String partOfTitle,
  }) async {
    if (await _networkChecker.isConnected()) {
      final either = await _online.getProductsContain(partOfTitle);
      return either.map((response) {
        final productsFiltered = convertJsonToList(
          response,
          ProductModel.fromJson,
        );

        return productsFiltered;
      });
    } else {
      return _local.getProductsContain(partOfTitle);
    }
  }
}
