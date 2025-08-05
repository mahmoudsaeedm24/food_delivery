import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/data/models/cart/cart_model.dart';
import 'package:food_delivery/features/cart/data/repo/cart_repo.dart';
import 'package:fpdart/fpdart.dart';

part 'change_product_quantity_state.dart';

class ChangeProductQuantityCubit extends Cubit<ChangeProductQuantityState> {
  ChangeProductQuantityCubit({required CartRepo repo})
    : _repo = repo,
      super(ChangeProductQuantityInitial(cartModel: CartModel.empty()));
  final CartRepo _repo;

  void loadInitialQuantity(CartModel cart) async {
    emit(ChangeProductQuantityInitial(cartModel: cart));
  }

  Future<void> increaseQuantity({required CartModel cart}) async {
    Either<Exception, CartModel> either = await _repo.changeQuantity(
      cartModel: cart,
      increase: true,
    );
    either.fold(
      (e) => emit(ChangeProductQuantityError(e, cartModel: state.cartModel)),
      (cartAfterEdit) => emit(
        ChangeProductQuantityIncrease(
          cartModel: state.cartModel.increaseQuantity(),
        ),
      ),
    );
  }

  Future<void> decreaseQuantity({required CartModel cart}) async {
    Either<Exception, CartModel> either = await _repo.changeQuantity(
      cartModel: cart,
      increase: false,
    );
    either.fold(
      (e) => emit(ChangeProductQuantityError(e, cartModel: state.cartModel)),
      (cartAfterEdit) => emit(
        ChangeProductQuantityDecrease(
          cartModel: state.cartModel.decreaseQuantity(),
        ),
      ),
    );
  }
}
