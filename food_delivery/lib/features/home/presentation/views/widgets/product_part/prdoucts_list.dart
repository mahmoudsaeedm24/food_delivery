import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/widgets/product_card.dart';
import 'package:food_delivery/features/home/presentation/controllers/get_products/get_all_products_cubit.dart';

class PrdouctsList extends StatelessWidget {
  const PrdouctsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        buildWhen: (previous, current) => current is GetProductsSuccess,
        builder: (context, state) {
          log(
            "ProductsList rebuild and state is ${state.runtimeType.toString()}",
          );
          switch (state) {
            case GetProductsInitial():
              {
                return SizedBox.shrink();
              }
            case GetProductsLoading():
              {
                return Center(child: CircularProgressIndicator());
              }
            case GetProductsFailed():
              {
                return Container();
              }
            case GetProductsSuccess(products: var products):
              {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(productModel: products[index]);
                  },
                );
              }
          }
        },
      ),
    );
  }
}
