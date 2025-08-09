import 'package:flutter/material.dart';
import 'package:frontend/core/theme/my_button_styles.dart';
import 'package:frontend/features/card/presentation/widgets/bank_card_shape.dart';
import 'package:frontend/features/card/presentation/widgets/card_inputs.dart';
import 'package:frontend/features/card/presentation/widgets/controllers.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  late Controllers controllers;
  @override
  void initState() {
    super.initState();
    controllers = Controllers(
      cardHolderController: TextEditingController(),
      cardNumberController: TextEditingController(),
      expireController: TextEditingController(),
      cvvController: TextEditingController(),
    );
  }

  @override
  void dispose() {
    controllers.cardHolderController.dispose();
    controllers.cardNumberController.dispose();
    controllers.cvvController.dispose();
    controllers.expireController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Card")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Doesn't work yet"),
              // content: Text("You will redirect you to home screen"),
            ),
          );
          // .then((value) {
          //   Future.delayed(Duration(seconds: 2), () async {
          //     await Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       MyPages.tabsScreen,
          //       (route) => false,
          //     );
          //   });
          // });
        },
        style: MyButtonStyles.mainButtonStyle,
        child: Text("Save Card"),
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              BankCardShape(),
              Expanded(child: CardInputs(controllers: controllers)),
            ],
          ),
        ),
      ),
    );
  }
}
