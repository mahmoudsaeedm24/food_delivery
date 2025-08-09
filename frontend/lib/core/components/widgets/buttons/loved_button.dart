import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartModelsCubit, CartModelsState>(
      buildWhen: (previous, current) =>
          current is ProductSuccessRemoved || current is ProductSuccessAdded,
      builder: (context, state) {
        final isFavorite = state.carts.any((cartItem) {
          // log(
          //   "CartButton || state is : ${state.runtimeType.toString()} for product: ${cartItem.productModel.title} and quantity: ${cartItem.quantity}",
          // );
          return cartItem.productModel.id == productModel.id;
        });

        return CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: MyColors.primaryColor,
            ),
            onPressed: () async {
              if (isFavorite) {
                await context.read<CartModelsCubit>().removeProduct(
                  productModel: productModel,
                );
              } else {
                final cart = CartModel.createCart(product: productModel);
                await context.read<CartModelsCubit>().addNewProduct(
                  cartModel: cart,
                );
              }
            },
          ),
        );
      },
    );
  }
}
