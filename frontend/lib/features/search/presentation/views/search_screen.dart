import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:frontend/features/search/presentation/cubit/get_filter_products_cubit.dart';
import 'package:frontend/features/search/presentation/widgets/filtered_product_list.dart';
import 'package:frontend/features/search/presentation/widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String choiceCat = CategoryModel.defaultCategory().id!;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              SearchInput(
                onChanged: (input) {
                  context.read<GetFilterProductsCubit>().getProductsContain(
                    partOfTitle: input,
                  );
                },
              ),
              Flexible(child: FilteredProductList()),
            ],
          ),
        );
      },
    );
  }
}
