import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:frontend/features/payment/presentation/views/widgets/item_ordered/product_ordered_tile.dart';

class ProductOrderedList extends StatelessWidget {
  const ProductOrderedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartModelsCubit, CartModelsState>(
      builder: (context, state) {
        final List<CartModel> carts = state.carts;
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: List.generate(
            carts.length,
            (index) => ProductOrderedTile(cartItem: carts[index]),
          ),
        );
      },
    );
  }
}
