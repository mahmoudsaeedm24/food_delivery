part of 'get_all_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final List<ProductModel> products;

  GetProductsSuccess({required this.products});
}

final class GetProductsFailed extends GetProductsState {
  final Exception e;

  GetProductsFailed({required this.e});
}
