import 'package:flutter/material.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/core/theme/my_text_styles.dart';

class BankCardShape extends StatelessWidget {
  const BankCardShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.amberAccent,
      ),
      padding: EdgeInsets.all(30),

      child: Stack(
        children: [
          Container(
            width: 30,
            decoration: BoxDecoration(
              color: MyColors.primaryColor.withAlpha(200),
              shape: BoxShape.circle,
            ),
          ),
          CardConstantDetails(),
        ],
      ),
    );
  }
}

class CardConstantDetails extends StatelessWidget {
  const CardConstantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "VISA",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("3822", style: MyTextStyles.visaTextStyle),
            Text("8293", style: MyTextStyles.visaTextStyle),
            Text("8292", style: MyTextStyles.visaTextStyle),
            Text("2356", style: MyTextStyles.visaTextStyle),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [Text("Card holder name"), Text("Alexser verguson")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [Text("Expiry Date"), Text("03/30")],
            ),
          ],
        ),
      ],
    );
  }
}

class CarDShape extends StatelessWidget {
  const CarDShape({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(28, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(28, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(28, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(child: child),
        ],
      ),
    );
  }
}
