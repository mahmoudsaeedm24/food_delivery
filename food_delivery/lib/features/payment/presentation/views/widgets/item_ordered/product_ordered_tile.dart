import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/cart/cart_model.dart';

class ProductOrderedTile extends StatelessWidget {
  const ProductOrderedTile({super.key, required this.cartItem});
  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(cartItem.productModel.poster),
            ),
          ),
          width: 50,
          height: 50,
        ),
        title: Text(cartItem.productModel.title),
        subtitle: Text('\$ ${cartItem.productModel.price.toStringAsFixed(2)}'),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${cartItem.quantity} items"),
            Text(
              '\$ ${(cartItem.productModel.price * cartItem.quantity).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
