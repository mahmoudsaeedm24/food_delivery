import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/router.dart';
import 'package:food_delivery/features/cart/presentation/view/widgets/products_list_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment),
        onPressed: () {
          Navigator.pushNamed(context, MyPages.paymentScreen);
        },
      ),
      body: ProductsListCart(),
    );
  }
}
