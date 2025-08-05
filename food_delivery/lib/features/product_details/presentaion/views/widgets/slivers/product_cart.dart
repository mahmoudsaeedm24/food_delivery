import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/widgets/buttons/add_to_cart_button.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int _productInCarts = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(25, 0, 0, 0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          if (_productInCarts > 0)
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      _productInCarts = _productInCarts > 0
                          ? _productInCarts--
                          : _productInCarts;
                    });
                  },
                  icon: Icon(Icons.minimize),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),

                IconButton.outlined(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  onPressed: () {
                    setState(() {
                      _productInCarts += _productInCarts;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          AddToCartButton(productModel: widget.productModel),
        ],
      ),
    );
  }
}
