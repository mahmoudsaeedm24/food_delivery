part of 'get_filter_products_cubit.dart';

sealed class GetFilterProductsState extends Equatable {
  const GetFilterProductsState();

  @override
  List<Object> get props => [];
}

final class GetFilterProductsInitial extends GetFilterProductsState {}

final class GetFilterProductsLoading extends GetFilterProductsState {}

final class GetFilterProductsSuccess extends GetFilterProductsState {
  final List<ProductModel> filteredProducts;

  const GetFilterProductsSuccess({required this.filteredProducts});
  @override
  List<Object> get props => [...super.props, filteredProducts];
}

final class GetFilterProductsFailed extends GetFilterProductsState {
  final Exception e;

  const GetFilterProductsFailed({required this.e});
  @override
  List<Object> get props => [...super.props, e];
}
