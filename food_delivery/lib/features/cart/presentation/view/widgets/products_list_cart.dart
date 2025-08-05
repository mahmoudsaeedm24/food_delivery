import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';
import 'package:food_delivery/features/cart/presentation/view/widgets/product_card_tile.dart';

class ProductsListCart extends StatelessWidget {
  const ProductsListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartModelsCubit, CartModelsState>(
      listenWhen: (previous, current) => current is CartModelsFailed,
      listener: (context, state) {
        state as CartModelsFailed;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.e.toString())));
      },
      buildWhen: (previous, current) =>
           current is! CartModelsFailed,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.carts.length,
          itemBuilder: (context, index) {
            return ProductCardTile(cartItem: state.carts[index]);
          },
        );
      },
    );
  }
}
