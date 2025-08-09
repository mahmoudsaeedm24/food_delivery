part of 'cart_models_cubit.dart';

sealed class CartModelsState extends Equatable {
  const CartModelsState({required this.carts});
  final List<CartModel> carts;
  @override
  List<Object> get props => [carts];
}

final class CartModelsInitial extends CartModelsState {
  const CartModelsInitial({required super.carts});
}

///*
final class ProductSuccessAdded extends CartModelsState {
  final int cartIndex;

  const ProductSuccessAdded({required this.cartIndex, required super.carts});
  @override
  List<Object> get props => [...super.props, cartIndex];
}

///* emitted when call getAllProducts method
final class CartModelsLoaded extends CartModelsState {
  const CartModelsLoaded({required super.carts});

  @override
  List<Object> get props => [...super.props];
}

///* emitted when we remove product from cart List
final class ProductSuccessRemoved extends CartModelsState {
  const ProductSuccessRemoved({required super.carts});
}

///* emitted when exception happend during remove
final class CartModelsFailed extends CartModelsState {
  final Exception e;

  const CartModelsFailed({required this.e, required super.carts});

  @override
  List<Object> get props => [...super.props, e];
}
