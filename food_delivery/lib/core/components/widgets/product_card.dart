
import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/components/widgets/buttons/loved_button.dart';
import 'package:food_delivery/features/product_details/presentaion/views/screens/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // log("productCart rebuild");
    final tag = "${widget.productModel.id}_main";
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(productModel: widget.productModel),
          ),
        );
        // log("tag $tag");
      },
      child: Card(
        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ========== Image with Heart ==========
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.productModel.poster,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CartButton(productModel: widget.productModel),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// ========== Product Name ==========
              Text(
                widget.productModel.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              /// ========== Rating and Distance ==========
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(widget.productModel.rating.toString()),
                    ],
                  ),

                  /// ========== Price ==========
                  Text(
                    "\$ ${widget.productModel.price}",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
