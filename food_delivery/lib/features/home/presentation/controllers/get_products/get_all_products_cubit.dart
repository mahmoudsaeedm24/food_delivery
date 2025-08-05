import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/data/repo/get_products_repo.dart';

import '../../../../../core/components/data/models/product/product_model.dart';

part 'get_all_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this._repo) : super(GetProductsInitial());
  final GetProductsRepo _repo;
  Future<void> getProductsByCategoryId({required String categoryId}) async {
    emit(GetProductsLoading());

    final either = await _repo.getProductsByCategoryId(categoryId: categoryId);
    either.fold(
      (e) => emit(GetProductsFailed(e: e)),
      (products) => emit(GetProductsSuccess(products: products)),
    );
  }

  void refreshProducts({required String categoryId}) {
    getProductsByCategoryId(categoryId: categoryId);
  }
}
