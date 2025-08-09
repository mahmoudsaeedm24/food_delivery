import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/features/cart/data/repo/cart_repo.dart';
import 'package:fpdart/fpdart.dart';

part 'cart_models_state.dart';

class CartModelsCubit extends Cubit<CartModelsState> {
  CartModelsCubit(this._repo)
    : super(CartModelsInitial(carts: List.from(_repo.getProductsFromCart())));
  final CartRepo _repo;

  Future<void> addNewProduct({required CartModel cartModel}) async {
    try {
      final int cartIndex = await _repo.addNewProduct(cartModel: cartModel);
      emit(
        ProductSuccessAdded(
          cartIndex: cartIndex,
          carts: List<CartModel>.from(state.carts)..add(cartModel),
        ),
      );
    } on Exception catch (e) {
      emit(CartModelsFailed(e: e, carts: List<CartModel>.from(state.carts)));
    }
  }

  Future<void> removeProduct({
    CartModel? cartModel,
    ProductModel? productModel,
  }) async {
    assert(
      (cartModel != null) ^ (productModel != null),
      'Either cartModel or productModel must be provided, but not both.',
    );
    Either<Exception, CartModel> either = await _repo.removeProductFromCart(
      cartModel: cartModel,
      productModel: productModel,
    );

    either.match(
      (e) => emit(
        CartModelsFailed(e: e, carts: List<CartModel>.from(state.carts)),
      ),
      (cartDeleted) => emit(
        ProductSuccessRemoved(
          carts: List<CartModel>.from(state.carts)..remove(cartDeleted),
        ),
      ),
    );
  }

  void getAllProducts() {
    emit(CartModelsLoaded(carts: List<CartModel>.from(state.carts)));
  }

  void updateCartModel({required CartModel updatedCart}) {
    final List<CartModel> cartModels = List.from(state.carts);
    final index = cartModels.indexWhere(
      (element) => element.id == updatedCart.id,
    );

    if (index != -1) {
      cartModels[index] = updatedCart;
      emit(CartModelsLoaded(carts: cartModels));
    }
  }
}
