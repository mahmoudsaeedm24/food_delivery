import 'package:dio/dio.dart';
import 'package:frontend/core/components/data/data_sources/category_data_source/category_data_source_local.dart';
import 'package:frontend/core/components/data/data_sources/category_data_source/category_data_source_online.dart';
import 'package:frontend/core/utils/network/network_checker.dart';
import 'package:frontend/core/utils/repo_helper/convert_json_to_list.dart';
import 'package:fpdart/fpdart.dart';

import '../model/category_model.dart';

class GetCategoriesRepo {
  final CategoryDataSourceOnline _online;
  final CategoryDataSourceLocal _local;
  final NetworkChecker _networkChecker;
  // final Catego _box;

  GetCategoriesRepo({
    required CategoryDataSourceOnline online,
    required CategoryDataSourceLocal local,
    required NetworkChecker networkChecker,
  }) : _online = online,
       _local = local,
       _networkChecker = networkChecker;

  ///* check the connection, and determine the source depending on it
  Future<Either<Exception, List<CategoryModel>>> getAllCategories() async {
    return (await _networkChecker.isConnected())
        ? await _getCategoriesOnline()
        : await _getCategoriesLocal();
  }

  ///* add default category to other categories either online or locally
  ///* when use it , the returned data will be like this
  ///* [DefaultCategoryModel, otherCategories...]
  List<CategoryModel> _addDefaultCategoryAutomatic(List<CategoryModel> others) {
    final List<CategoryModel> categories = [CategoryModel.defaultCategory()];
    categories.addAll(others);
    return categories;
  }

  Future<Either<Exception, List<CategoryModel>>> _getCategoriesLocal() async {
    final either = await _local.getAllCategories();
    return either.map((categories) {
      return _addDefaultCategoryAutomatic(categories);
    });
  }

  Future<Either<Exception, List<CategoryModel>>> _getCategoriesOnline() async {
    try {
      final either = (await _online.getAllCategories());
      return either.map((Response response) {
        final List<CategoryModel> convertedCategories =
            convertJsonToList<CategoryModel>(response, CategoryModel.fromJson);
        _local.storeAllCategories(categories: convertedCategories);
        return _addDefaultCategoryAutomatic(convertedCategories);
      });
    } on Exception catch (e) {
      return left(e);
    }
  }
}
