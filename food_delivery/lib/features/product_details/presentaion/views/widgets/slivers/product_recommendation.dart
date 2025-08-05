import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/widgets/product_card.dart';
import 'package:food_delivery/features/product_details/presentaion/views/controllers/get_recommended_products/get_recommended_products_cubit.dart';

class ProductRecommendation extends StatelessWidget {
  const ProductRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetRecommendedProductsCubit,
      GetRecommendedProductsState
    >(
      buildWhen: (previous, current) =>
          current is GetRecommendedProductsSuccess,
      builder: (context, state) {
        state is GetRecommendedProductsSuccess;
        if (state is GetRecommendedProductsSuccess) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.2 / 4,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: state.products[index]);
            },
          );
        } else {
          return SliverToBoxAdapter();
        }
      },
    );
  }
}
