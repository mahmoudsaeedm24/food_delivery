part of 'get_recommended_products_cubit.dart';

@immutable
sealed class GetRecommendedProductsState {}

final class GetRecommendedProductsInitial extends GetRecommendedProductsState {}

final class GetRecommendedProductsLoading extends GetRecommendedProductsState {}

final class GetRecommendedProductsSuccess extends GetRecommendedProductsState {
  final List<ProductModel> products;

  GetRecommendedProductsSuccess({required this.products});
}

final class GetRecommendedProductsFailed extends GetRecommendedProductsState {}
