part of 'change_product_quantity_cubit.dart';

sealed class ChangeProductQuantityState {
  final CartModel cartModel;

  ChangeProductQuantityState({required this.cartModel});
}

final class ChangeProductQuantityInitial extends ChangeProductQuantityState {
  ChangeProductQuantityInitial({required super.cartModel});
}

final class ChangeProductQuantityIncrease extends ChangeProductQuantityState {
  ChangeProductQuantityIncrease({required super.cartModel});
}

final class ChangeProductQuantityDecrease extends ChangeProductQuantityState {
  ChangeProductQuantityDecrease({required super.cartModel});
}

final class ChangeProductQuantityError extends ChangeProductQuantityState {
  ChangeProductQuantityError(this.e, {required super.cartModel});
  final Exception e;
}
