import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/cart/cart_model.dart';
import 'package:frontend/features/cart/presentation/controllers/change_quantity/change_product_quantity_cubit.dart';
import 'package:frontend/features/cart/presentation/controllers/cubit/cart_models_cubit.dart';

import '../../../../../core/dependency_injection/di.dart' as di;

class IncrementDecrementButtons extends StatelessWidget {
  const IncrementDecrementButtons({super.key, required this.cartItem});
  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeProductQuantityCubit>(
      create: (context) => di.getIt<ChangeProductQuantityCubit>(),
      child: IncrementDecrementRow(cartItem: cartItem),
    );
  }
}

class IncrementDecrementRow extends StatefulWidget {
  const IncrementDecrementRow({super.key, required this.cartItem});
  final CartModel cartItem;
  @override
  State<IncrementDecrementRow> createState() => _IncrementDecrementRowState();
}

class _IncrementDecrementRowState extends State<IncrementDecrementRow> {
  @override
  void initState() {
    super.initState();
    context.read<ChangeProductQuantityCubit>().loadInitialQuantity(
      widget.cartItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        IconButton(
          alignment: Alignment.topCenter,
          color: Colors.red,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              const Color.fromARGB(179, 228, 224, 224),
            ),
          ),
          onPressed: () async {
            await context.read<ChangeProductQuantityCubit>().decreaseQuantity(
              cart: widget.cartItem,
            );

            context.read<CartModelsCubit>().updateCartModel(
              updatedCart: widget.cartItem.decreaseQuantity(),
            );

            // context.read<GetProductFromCartCubit>().refresh();
          },
          icon: Icon(Icons.minimize),
        ),
        BlocBuilder<ChangeProductQuantityCubit, ChangeProductQuantityState>(
          builder: (context, state) {
            return Text(state.cartModel.quantity.toString());
          },
        ),
        IconButton(
          color: Colors.blue,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              const Color.fromARGB(179, 228, 224, 224),
            ),
          ),
          onPressed: () async {
            await context.read<ChangeProductQuantityCubit>().increaseQuantity(
              cart: widget.cartItem,
            );
            context.read<CartModelsCubit>().updateCartModel(
              updatedCart: widget.cartItem.increaseQuantity(),
            );
            // context.read<GetProductFromCartCubit>().refresh();
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
