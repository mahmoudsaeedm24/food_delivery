import 'dart:developer';

import 'package:frontend/core/components/data/data_sources/cart_caching_data_source.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/components/data/models/cart/cart_model.dart';

class CartRepo {
  final CartCachingDataSource _online;
  /*
    ! 1. addNewProduct
    ! 2. removeProduct
    ! 3. changeQunatity
    ! 4. getAllProducts
   */
  CartRepo({required CartCachingDataSource online}) : _online = online;

  Future<int> addNewProduct({required CartModel cartModel}) async {
    return await _online.addNewProduct(cartModel: cartModel);
  }

  ///* [increase] parameter is an indicator for detect if product quantity increased or decresed
  ///* [ increase ] = true  ->   _increaseQuantity
  ///* [ increase ] = false ->   _decreaseQuantity
  ///* if no errors , quantity will returned back
  Future<Either<Exception, CartModel>> changeQuantity({
    required CartModel cartModel,
    required bool increase,
  }) async {
    return increase
        ? _increseQuantity(cartModel: cartModel)
        : _decreseQuantity(cartModel: cartModel);
  }

  Future<Either<Exception, CartModel>> removeProductFromCart({
    CartModel? cartModel,
    ProductModel? productModel,
  }) async {
    return await _online.removeProduct(
      cartModel: cartModel,
      productModel: productModel,
    );
  }

  List<CartModel> getProductsFromCart() {
    return _online.getProductsFromCart();
  }

  //! -------------- private methods -------------------------
  //? --------------------------------------------------------
  //! --------------------------------------------------------
  Future<Either<Exception, CartModel>> _increseQuantity({
    required CartModel cartModel,
  }) async {
    final CartModel newCart = cartModel.increaseQuantity();
    log("CartModel quantity = ${cartModel.quantity}");
    log("newCart quantity = ${newCart.quantity}");
    final either = await _online.changeQunatity(cartModel: newCart);
    //? convert returned unit to cartModel
    return either.map<CartModel>((u) {
      return newCart;
    });
  }

  Future<Either<Exception, CartModel>> _decreseQuantity({
    required CartModel cartModel,
  }) async {
    final CartModel newCart = cartModel.decreaseQuantity();
    log("CartModel quantity = ${cartModel.quantity}");
    log("newCart quantity = ${newCart.quantity}");
    final either = await _online.changeQunatity(cartModel: newCart);
    //? convert returned unit to cartModel
    return either.map<CartModel>((u) {
      return newCart;
    });
  }
}
