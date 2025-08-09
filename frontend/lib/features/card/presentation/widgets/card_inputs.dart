import 'package:flutter/widgets.dart';
import 'package:frontend/core/components/widgets/s_text_field_widget.dart';
import 'package:frontend/features/card/presentation/widgets/controllers.dart';

class CardInputs extends StatelessWidget {
  const CardInputs({super.key, required this.controllers});
  final Controllers controllers;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputCol(
          title: "Cardholder Name",
          controller: controllers.cardHolderController,
        ),
        InputCol(
          title: "Card Number",
          controller: controllers.cardNumberController,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Flexible(
              child: InputCol(
                title: "Expiry Date",
                controller: controllers.expireController,
              ),
            ),
            Flexible(
              child: InputCol(
                title: "3-Digit CVV",
                controller: controllers.cvvController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InputCol extends StatelessWidget {
  const InputCol({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(title),
          STextFieldWidget(controller: controller),
        ],
      ),
    );
  }
}
