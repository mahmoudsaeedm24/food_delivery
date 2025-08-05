
import 'package:food_delivery/core/components/data/models/cart/cart_model.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/utils/hive_utils/hive_prepare.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartCachingDataSource {
  late Box<CartModel> cartBox;

  CartCachingDataSource() {
    cartBox = Hive.box<CartModel>(Boxes.cartBox.name);
  }

  /*
  1. add new product
  2. remove product
  3. increse qunatity
  4. decrese quantity
   */

  Future<int> addNewProduct({required CartModel cartModel}) async =>
      await cartBox.add(cartModel);

  Future<Either<Exception, CartModel>> removeProduct({
    CartModel? cartModel,
    ProductModel? productModel,
  }) async {
    assert(
      (cartModel != null) ^ (productModel != null),
      'Either cartModel or productModel must be provided, but not both.',
    );

    try {
      CartModel currentCartModel;
      if (productModel != null) {
        final CartModel cartModel = cartBox.values.firstWhere((cart) {
          return cart.productModel.id == productModel.id;
        });
        currentCartModel = cartModel;
      } else {
        currentCartModel = cartModel!;
      }
      final int cartModelKey = cartBox.keys.firstWhere(
        (cart) => cartBox.get(cart)!.id == currentCartModel.id,
        orElse: () => -1,
      );
      await cartBox.delete(cartModelKey);
      return right(currentCartModel);
    } on Exception catch (e) {
      return left(e);
    }
  }

  ///? send a cartModel after change quantity
  Future<Either<Exception, Unit>> changeQunatity({
    required CartModel cartModel,
  }) async {
    try {
      final int key = cartBox.keys.firstWhere(
        (cart) => cartBox.get(cart)!.id == cartModel.id,
        orElse: () => -1,
      );
      await cartBox.put(key, cartModel);
      // log("put | quantity = ${cartModel.quantity} for key $key");
      return right(unit);
    } on Exception catch (e) {
      return left(e);
    }
  }

  List<CartModel> getProductsFromCart() {
    return cartBox.values.toList();
  }
}
