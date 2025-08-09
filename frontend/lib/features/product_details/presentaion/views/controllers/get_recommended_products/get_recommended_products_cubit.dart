import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/product_details/data/repo/get_recommended_products_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/components/data/models/product/product_model.dart';

part 'get_recommended_products_state.dart';

class GetRecommendedProductsCubit extends Cubit<GetRecommendedProductsState> {
  GetRecommendedProductsCubit({required GetRecommendedProductsRepo repo})
    : _repo = repo,
      super(GetRecommendedProductsInitial());
  final GetRecommendedProductsRepo _repo;

  Future<void> getRecommendedProducts() async {
    emit(GetRecommendedProductsLoading());

    final recommends = await _repo.getRecommenedProducts();
    recommends.fold(
      (e) => emit(GetRecommendedProductsFailed()),
      (products) => emit(GetRecommendedProductsSuccess(products: products)),
    );
  }
}
