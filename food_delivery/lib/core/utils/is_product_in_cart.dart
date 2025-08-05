import '../components/data/models/cart/cart_model.dart';
import '../components/data/models/product/product_model.dart';

bool isProductAlreadyInCart({
  required List<CartModel> cartItems,
  required ProductModel targetProduct,
}) {
  return cartItems.any((cartItem) => cartItem.productModel == targetProduct);
}
