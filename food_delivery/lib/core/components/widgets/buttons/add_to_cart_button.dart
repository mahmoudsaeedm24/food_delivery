import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        
      },
      label: Text("Add to Cart"),
      icon: Icon(Icons.shopping_cart_outlined),
      style: MyButtonStyles.mainButtonStyle,
    );
  }
}
