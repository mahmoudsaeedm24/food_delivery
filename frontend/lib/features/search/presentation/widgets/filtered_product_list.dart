import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/features/search/presentation/cubit/get_filter_products_cubit.dart';
import 'package:frontend/features/search/presentation/widgets/no_product_found.dart';
import 'package:frontend/features/search/presentation/widgets/product_card_search.dart';

class FilteredProductList extends StatelessWidget {
  const FilteredProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFilterProductsCubit, GetFilterProductsState>(
      builder: (context, state) {
        switch (state) {
          case GetFilterProductsLoading _:
            {
              return Center(child: CircularProgressIndicator());
            }

          case GetFilterProductsFailed _:
            {
              return NoProductFound();
            }
          case GetFilterProductsSuccess(
            filteredProducts: List<ProductModel> filteredProducts,
          ):
            {
              return ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCardSearch(
                    productModel: filteredProducts[index],
                  );
                },
              );
            }
          case GetFilterProductsInitial _:
            {
              //TODO create a cubit that get old researchs
              return Container();
            }
        }
      },
    );
  }
}
