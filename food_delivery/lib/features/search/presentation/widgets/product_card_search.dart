import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/features/product_details/presentaion/views/screens/product_details_screen.dart';

class ProductCardSearch extends StatelessWidget {
  const ProductCardSearch({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(productModel: productModel),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(productModel.poster),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(productModel.title),
                Text(productModel.description),
                Text(productModel.rating.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
