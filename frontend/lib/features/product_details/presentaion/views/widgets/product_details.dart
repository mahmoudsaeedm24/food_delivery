import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/features/product_details/presentaion/views/controllers/get_recommended_products/get_recommended_products_cubit.dart';
import 'package:frontend/features/product_details/presentaion/views/widgets/slivers/product_details_content.dart';
import 'package:frontend/features/product_details/presentaion/views/widgets/slivers/product_image_carousel.dart';
import 'package:frontend/features/product_details/presentaion/views/widgets/slivers/product_recommendation.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    context.read<GetRecommendedProductsCubit>().getRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProductImageCarousel(productModel: widget.productModel),
        ProductDetailsContent(productModel: widget.productModel),
        ProductRecommendation(),
      ],
    );
  }
}
