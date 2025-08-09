import 'package:equatable/equatable.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:uuid/uuid.dart';

class CartModel extends Equatable {
  final String id;
  final ProductModel productModel;
  final int quantity;

  const CartModel({
    required this.id,
    required this.productModel,
    required this.quantity,
  });

  factory CartModel.empty() {
    return CartModel(id: "", productModel: ProductModel.empty(), quantity: 0);
  }

  factory CartModel.createCart({required ProductModel product}) {
    return CartModel(id: const Uuid().v4(), productModel: product, quantity: 1);
  }

  CartModel increaseQuantity() {
    return CartModel(
      id: id,
      productModel: productModel,
      quantity: quantity + 1,
    );
  }

  CartModel decreaseQuantity() {
    return CartModel(
      id: id,
      productModel: productModel,
      quantity: quantity <= 1 ? quantity : quantity - 1,
    );
  }

  CartModel copyWith({String? id, ProductModel? productModel, int? quantity}) {
    return CartModel(
      id: id ?? this.id,
      productModel: productModel ?? this.productModel,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, quantity, productModel];

  @override
  String toString() =>
      """
  id : $id,
  productModel details : 
    ${productModel.toString()},
  quantity: $quantity,
""";
  // @override
  // bool operator ==(covariant ProductModel other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.categoryId == categoryId &&
  //       other.title == title &&
  //       other.price == price &&
  //       other.poster == poster &&
  //       other.description == description &&
  //       listEquals(other.images, images) &&
  //       other.rating == rating;
  // }
}
