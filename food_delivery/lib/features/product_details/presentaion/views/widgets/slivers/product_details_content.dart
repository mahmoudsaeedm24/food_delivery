import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/my_text_styles.dart';
import '../../../../../../core/components/widgets/buttons/see_all_button.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    const double spacing = 10;
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(spacing),
              Text(productModel.title, style: MyTextStyles.textHeadline2Style),
              Gap(spacing),
              Text(
                "\$ ${productModel.price}",
                style: MyTextStyles.textHeadline3Style,
              ),
              Gap(spacing),
              Container(
                color: MyColors.primaryColor.withAlpha(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.podcasts_rounded),
                        Text(
                          "\$ Free Delivery",
                          style: MyTextStyles.textBodyStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.podcasts_rounded),
                        Text("\$ 20 - 30", style: MyTextStyles.textBodyStyle),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star),
                        Text(
                          "\$ ${productModel.rating}",
                          style: MyTextStyles.textBodyStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(spacing),
              Divider(),
              Text("Description", style: MyTextStyles.textHeadline3Style),
              Gap(spacing),
              Text(productModel.description, style: MyTextStyles.textBodyStyle),
              Gap(spacing * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended For You",
                    style: MyTextStyles.textHeadline3Style,
                  ),
                  SeeAllButton(),
                ],
              ),
              // Gap(spacing),
            ],
          ),
        ),
      ]),
    );
  }
}
