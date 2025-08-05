import 'package:dio/dio.dart';
import 'package:food_delivery/core/components/base/repo_dependencies.dart';
import 'package:food_delivery/core/components/cubit/user_cubit.dart';
import 'package:food_delivery/core/components/data/data_sources/cart_caching_data_source.dart';
import 'package:food_delivery/core/components/data/data_sources/category_data_source/category_data_source_local.dart';
import 'package:food_delivery/core/components/data/data_sources/category_data_source/category_data_source_online.dart';
import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_local.dart';
import 'package:food_delivery/core/components/data/data_sources/product_data_source/product_data_source_online.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_local.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_online.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/components/data/repos/user_repo.dart';
import 'package:food_delivery/core/utils/hive_utils/hive_prepare.dart';
import 'package:food_delivery/core/utils/network/dio/dio_helper.dart';
import 'package:food_delivery/core/utils/network/network_checker.dart';
import 'package:food_delivery/features/auth/data/auth_repo.dart';
import 'package:food_delivery/features/auth/data/data_source/auth_data_source.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/controllers/cubit/sign_up_cubit.dart';
import 'package:food_delivery/features/cart/presentation/controllers/change_quantity/change_product_quantity_cubit.dart';
import 'package:food_delivery/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:food_delivery/features/home/data/model/category_model.dart';
import 'package:food_delivery/features/home/data/repo/get_categories_repo.dart';
import 'package:food_delivery/features/home/data/repo/get_products_repo.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_categories/get_categories_cubit.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_products/get_all_products_cubit.dart';
import 'package:food_delivery/features/personal_data/presentation/controllers/cubit/image_change_cubit.dart';
import 'package:food_delivery/features/product_details/data/repo/get_recommended_products_repo.dart';
import 'package:food_delivery/features/product_details/presentaion/views/controllers/get_recommended_products/get_recommended_products_cubit.dart';
import 'package:food_delivery/features/search/data/get_filter_products_repo.dart';
import 'package:food_delivery/features/search/presentation/cubit/get_filter_products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/auth/login/presentation/controller/cubit/login_cubit.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../utils/network/dio/api_constants.dart';

final getIt = GetIt.I;

void init() {
  _initNetworkChecker();
  _initDio();
  _initLocalDataSource();
  _initOnlineDataSource();
  _initRepos();
  _initCubits();
}

void _initNetworkChecker() {
  getIt.registerLazySingleton<NetworkChecker>(() => NetworkChecker());
}

void _initDio() {
  BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
    contentType: ApiConstants.contentType,
    connectTimeout: Duration(seconds: 5),
  );
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(
      () => Dio(options)..interceptors.add(DioHelper.sendToken),
    );
    // log("dio = ${getIt<Dio>().options.headers.values}");
  }
}

void _initLocalDataSource() {
  getIt.registerSingleton<ProductDataSourceLocal>(
    ProductDataSourceLocal(box: Hive.box<ProductModel>(Boxes.productBox.name)),
  );
  getIt.registerSingleton<CategoryDataSourceLocal>(
    CategoryDataSourceLocal(
      box: Hive.box<CategoryModel>(Boxes.categoryBox.name),
    ),
  );
  getIt.registerSingleton<UserDataSourceLocal>(UserDataSourceLocal());
}

void _initOnlineDataSource() {
  if (!getIt.isRegistered<AuthDataSource>()) {
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  }

  if (!getIt.isRegistered<CategoryDataSourceOnline>()) {
    getIt.registerLazySingleton<CategoryDataSourceOnline>(
      () => CategoryDataSourceOnline(dio: getIt<Dio>()),
    );
  }

  if (!getIt.isRegistered<ProductDataSourceOnline>()) {
    getIt.registerLazySingleton<ProductDataSourceOnline>(
      () => ProductDataSourceOnline(dio: getIt<Dio>()),
    );
  }

  if (!getIt.isRegistered<CartCachingDataSource>()) {
    getIt.registerLazySingleton<CartCachingDataSource>(
      () => CartCachingDataSource(),
    );
  }

  if (!getIt.isRegistered<UserDataSourceOnline>()) {
    getIt.registerLazySingleton<UserDataSourceOnline>(
      () => UserDataSourceOnline(dio: getIt<Dio>()),
    );
  }
}

void _initRepos() {
  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(online: getIt<AuthDataSource>()),
    );
  }

  //! cause error
  if (!getIt.isRegistered<CartRepo>()) {
    getIt.registerLazySingleton<CartRepo>(
      () => CartRepo(online: getIt<CartCachingDataSource>()),
    );
  }

  ///! RepoDependencies used only here
  if (!getIt.isRegistered<UserRepo>()) {
    getIt.registerLazySingleton<UserRepo>(
      () => UserRepo(
        repoDenpendencies: RepoDependencies(
          online: getIt<UserDataSourceOnline>(),
          local: getIt<UserDataSourceLocal>(),
          networkChecker: getIt<NetworkChecker>(),
        ),
      ),
    );
  }

  if (!getIt.isRegistered<GetCategoriesRepo>()) {
    getIt.registerLazySingleton<GetCategoriesRepo>(
      () => GetCategoriesRepo(
        online: getIt<CategoryDataSourceOnline>(),
        local: getIt<CategoryDataSourceLocal>(),
        networkChecker: getIt<NetworkChecker>(),
      ),
    );
  }

  if (!getIt.isRegistered<GetProductsRepo>()) {
    getIt.registerLazySingleton<GetProductsRepo>(
      () => GetProductsRepo(
        productDataSourceOnline: getIt<ProductDataSourceOnline>(),
        productDataSourceLocal: getIt<ProductDataSourceLocal>(),
        networkChecker: getIt<NetworkChecker>(),
      ),
    );
  }

  if (!getIt.isRegistered<GetRecommendedProductsRepo>()) {
    getIt.registerLazySingleton<GetRecommendedProductsRepo>(
      () => GetRecommendedProductsRepo(
        productDataSource: getIt<ProductDataSourceOnline>(),
        productDataSourceLocal: getIt<ProductDataSourceLocal>(),
        networkChecker: getIt<NetworkChecker>(),
      ),
    );
  }

  getIt.registerLazySingleton<GetFilterProductsRepo>(
    () => GetFilterProductsRepo(
      online: getIt<ProductDataSourceOnline>(),
      local: getIt<ProductDataSourceLocal>(),
      networkChecker: getIt<NetworkChecker>(),
    ),
  );
}

void _initCubits() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<AuthRepo>()));
  getIt.registerFactory<GetCategoriesCubit>(
    () => GetCategoriesCubit(getIt<GetCategoriesRepo>()),
  );
  getIt.registerFactory<GetProductsCubit>(
    () => GetProductsCubit(getIt<GetProductsRepo>()),
  );
  getIt.registerFactory<GetRecommendedProductsCubit>(
    () =>
        GetRecommendedProductsCubit(repo: getIt<GetRecommendedProductsRepo>()),
  );
  getIt.registerFactory<ChangeProductQuantityCubit>(
    () => ChangeProductQuantityCubit(repo: getIt<CartRepo>()),
  );
  getIt.registerFactory<CartModelsCubit>(
    () => CartModelsCubit(getIt<CartRepo>()),
  );

  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<UserRepo>()));

  getIt.registerFactory<GetFilterProductsCubit>(
    () => GetFilterProductsCubit(getIt<GetFilterProductsRepo>()),
  );

  
}
