// import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:food_delivery/features/home/data/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    // required this.choice,
    required this.isActive,
    this.onTap,
    required this.categoryModel,
  });
  // final C2Choice<int> choice;
  final bool isActive;
  final void Function()? onTap;
  final CategoryModel categoryModel;

  // double _getMargin() {
  //   return 18 - 2 * (m.log(categoriesLength) / m.log(2)); // log2(items)
  // }

  @override
  Widget build(BuildContext context) {
    // log("cat ${categoryModel.title} isActive $isActive");
    // final CategoryModel categoryModel = choice.meta as CategoryModel;
    // d.log("code of icon ${categoryModel.iconCode}");
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          // color: Colors.amber,
          color: isActive ? Colors.amber : null,
          borderRadius: isActive ? BorderRadius.circular(20) : null,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IconData(
                int.parse(categoryModel.iconCode),
                fontFamily: "MaterialIcons",
              ),
            ),
            Text(categoryModel.title),
          ],
        ),
      ),
    );
  }
}
