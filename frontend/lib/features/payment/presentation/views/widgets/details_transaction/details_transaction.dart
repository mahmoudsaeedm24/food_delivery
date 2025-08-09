// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/core/theme/my_text_styles.dart';
import 'package:frontend/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';

class DetailsTransaction extends StatelessWidget {
  const DetailsTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartModelsCubit, CartModelsState>(
      builder: (context, state) {
        final totalPrice = state.carts.fold<double>(0.0, (
          previousValue,
          cartItem,
        ) {
          // log(
          //   "previous price = $previousValue + next Product price ${cartItem.productModel.price} * quantity ${cartItem.quantity}",
          // );
          return previousValue +
              (cartItem.productModel.price * cartItem.quantity);
        });
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text("Transaction Details", style: MyTextStyles.textHeadline3Style),
            const SizedBox(height: 10),
            MyRow(title: "total products price", value: "$totalPrice"),
            MyRow(title: "Driver", value: "${3.000}"),
            MyRow(
              title: "Tax 10%",
              value: (totalPrice * 0.1).toStringAsFixed(2),
            ),
            MyRow(
              title: "Total price",
              value: "${(totalPrice + 3.000 + (totalPrice * 0.1))}",
              valueTextStyle: MyTextStyles.textHeadline3Style.copyWith(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.title,
    required this.value,
    this.valueTextStyle,
  });
  final String title;
  final String value;
  final TextStyle? valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text('\$ $value', style: valueTextStyle),
      ],
    );
  }
}
