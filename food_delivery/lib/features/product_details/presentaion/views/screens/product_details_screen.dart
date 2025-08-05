import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/dependency_injection/di.dart';
import 'package:food_delivery/features/product_details/presentaion/views/controllers/get_recommended_products/get_recommended_products_cubit.dart';
import 'package:food_delivery/features/product_details/presentaion/views/widgets/product_details.dart';
import 'package:food_delivery/features/product_details/presentaion/views/widgets/slivers/product_cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<GetRecommendedProductsCubit>(),
        child: Scaffold(
          // appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          body: ProductDetails(productModel: productModel),
          bottomNavigationBar: ProductCart(productModel: productModel),
        ),
      ),
    );
  }
}
