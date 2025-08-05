import 'dart:developer';

import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_interface.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:fpdart/src/either.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDataSourceLocal extends ProductDataSourceInterface {
  final Box<ProductModel> _box;

  ProductDataSourceLocal({required Box<ProductModel> box}) : _box = box;

  Future<void> storeProductsLocally({
    required List<ProductModel> products,
  }) async {
    await _box.clear();
    await _box.addAll(products);
    log("Products Stored Successfully in Local DB");
  }

  @override
  Future<Either<Exception, List<ProductModel>>> getAllProducts() async {
    log("use local database to get products");
    try {
      return right(_box.values.toList());
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<ProductModel>>> getProductsByCategoryId(
    String categoryId,
  ) async {
        log("use local database to filter products");

    try {
      final productsFiltered = _box.values.where((productItem) {
        return productItem.categoryId.id == categoryId;
      }).toList();
      return right(productsFiltered);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<ProductModel>>> getProductsContain(
    String name,
  ) async {
        log("use local database to filter products");

    try {
      final productsFiltered = _box.values.where((item) {
        return item.title.contains(name);
      }).toList();
      return right(productsFiltered);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
