import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/search/data/get_filter_products_repo.dart';

import '../../../../core/components/data/models/product/product_model.dart';

part 'get_filter_products_state.dart';

class GetFilterProductsCubit extends Cubit<GetFilterProductsState> {
  GetFilterProductsCubit(this._repo) : super(GetFilterProductsInitial());
  final GetFilterProductsRepo _repo;

  Future<void> getProductsContain({required String partOfTitle}) async {
    emit(GetFilterProductsLoading());
    final either = await _repo.getProductsContain(partOfTitle: partOfTitle);
    either.fold((e) => emit(GetFilterProductsFailed(e: e)), (products) {
      if (products.isEmpty) {
        emit(GetFilterProductsFailed(e: Exception("We couldn't find any result!")));
      } else {
      emit(GetFilterProductsSuccess(filteredProducts: products));

      }
    });
  }
}
