import 'package:flutter/material.dart';
import 'package:frontend/core/theme/my_button_styles.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: MyButtonStyles.mainButtonStyle,
            child: Text("Continue"),
          ),
        ),
      ],
    );
  }
}
