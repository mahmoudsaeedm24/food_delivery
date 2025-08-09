import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/cubit/user_cubit.dart';
import 'package:frontend/core/theme/my_button_styles.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/features/payment/presentation/views/widgets/details_transaction/details_transaction.dart';
import 'package:frontend/features/payment/presentation/views/widgets/dliver_to/deliver_to.dart';
import 'package:frontend/features/payment/presentation/views/widgets/item_ordered/item_ordered.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment"), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          //TODO navigation to checkout screen
          Navigator.pushNamed(context, MyPages.addCardScreen);
        },
        style: MyButtonStyles.mainButtonStyle,
        child: Text("Checkout Now"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),

            child: Column(
              children: [ItemOrdered(), DetailsTransaction(), DeliverTo()],
            ),
          ),
        ),
      ),
    );
  }
}
