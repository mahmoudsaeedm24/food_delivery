import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/data/models/cart/cart_model.dart';
import 'package:food_delivery/core/components/data/models/product/product_model.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/theme/my_text_styles.dart';
import 'package:food_delivery/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:food_delivery/features/cart/presentation/view/widgets/increment_decrement_buttons.dart';

class ProductCardTile extends StatelessWidget {
  const ProductCardTile({super.key, required this.cartItem});
  final CartModel cartItem;

  // bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    final ProductModel product = cartItem.productModel;
    return InkWell(
      onTap: () {
        log(cartItem.toString());
      },
      child: Container(
        color: const Color.fromARGB(255, 233, 232, 232),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          horizontalTitleGap: 0,

          // leading: CartButton(productModel: cartItem.productModel),
          title: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red),
                  image: DecorationImage(
                    image: AssetImage(product.poster),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: MyTextStyles.textHeadline3Style),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(color: MyColors.primaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncrementDecrementButtons(cartItem: cartItem),
                        IconButton(
                          onPressed: () async {
                            await context.read<CartModelsCubit>().removeProduct(
                              cartModel: cartItem,
                            );
                          },
                          icon: Icon(Icons.delete_outline_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // trailing: ,
        ),
      ),
    );
  }
}
