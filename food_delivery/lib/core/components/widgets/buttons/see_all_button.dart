import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_text_styles.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: MyButtonStyles.linkButton2Style,
      child: Text("see All" , style: MyTextStyles.textLinkStyle,),
    );
  }
}
