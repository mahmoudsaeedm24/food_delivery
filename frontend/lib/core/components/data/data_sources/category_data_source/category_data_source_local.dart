import 'dart:developer';

import 'package:frontend/core/components/data/data_sources/category_data_source/category_data_source_interface.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:fpdart/src/either.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryDataSourceLocal extends CategoryDataSourceInterface {
  final Box<CategoryModel> _box;

  CategoryDataSourceLocal({required Box<CategoryModel> box}) : _box = box;
  @override
  Future<Either<Exception, List<CategoryModel>>> getAllCategories() async {
    log("use local database to get categories");

    try {
      return right(_box.values.toList());
    } on Exception catch (e) {
      return left(e);
    }
  }

  //TODO change in the future to store only the changed data
  Future<void> storeAllCategories({
    required List<CategoryModel> categories,
  }) async {
    await _box.clear();
    await _box.addAll(categories);

    log("Store Categories successfully in DB");
  }
}
