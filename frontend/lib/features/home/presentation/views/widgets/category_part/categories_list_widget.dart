import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:frontend/features/home/presentation/controllers/get_categories/get_categories_cubit.dart';
import 'package:frontend/features/home/presentation/views/widgets/category_part/category_card.dart';

import '../../../controllers/get_products/get_all_products_cubit.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  CategoryModel choosedIndexed = CategoryModel.defaultCategory();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        switch (state) {
          case GetCategoriesInitial():
            return const SizedBox.shrink();
          case GetCategoriesLoading():
            return Container(child: CircularProgressIndicator());
          case GetCategoriesFailed():
            return Container();
          case GetCategoriesSuccess(categories: var categoriesList):
            {
              
              return SizedBox(
                // color: Colors.blue,
                width: MediaQuery.sizeOf(context).width - 10,
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final bool isActive;

                    final currentCategory = categoriesList[index];
                    isActive = choosedIndexed.id == currentCategory.id;

                    return CategoryCard(
                      isActive: isActive,
                      categoryModel: currentCategory,
                      onTap: () async {
                        setState(() {
                          choosedIndexed = currentCategory;
                          // isActive = choosedIndexed?.id == currentCategory.id;
                          //TODO returnback
                        });
                        await context
                            .read<GetProductsCubit>()
                            .getProductsByCategoryId(
                              categoryId: currentCategory.id!,
                            );
                      },
                    );
                  },
                  itemCount: categoriesList.length,
                ),

                // child: ChipsChoice<CategoryModel>.single(
                //   padding: EdgeInsets.all(0),
                //   value: choosedIndexed,
                //   onChanged: (newIndices) => setState(() {
                //     choosedIndexed = newIndices;
                //   }),
                //   choiceItems: C2Choice.listFrom(
                //     hidden: (index, item) {
                //       //TODO change this value when click on `seeAll` button
                //       return index > 3;
                //     },

                //     source: categoriesList,
                //     value: (index, categoryModel) => index,
                //     label: (index, categoryModel) => categoryModel.title,
                //     meta: (index, categoryModel) =>
                //         categoryModel, //? store myModel to use it again in ChoiceBuilder
                //   ),
                //   choiceStyle: C2ChipStyle.filled(color: MyColors.primaryColor),
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                //   choiceBuilder: (choice, i) {
                //     // log("category : ${choice.selected}");
                //     return CategoryCard(
                //       choice: choice,
                //       categoriesLength: categoriesList.length,
                //     );
                //   },
                //   direction: Axis.horizontal,
                // ),
              );
            }
        }
      },
    );
  }
}
