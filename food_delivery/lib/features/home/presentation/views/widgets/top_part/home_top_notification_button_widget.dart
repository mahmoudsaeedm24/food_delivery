import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';

class HomeTopNotificationButtonWidget extends StatelessWidget {
  const HomeTopNotificationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {},
      icon: Icon(Icons.notifications_outlined),
      style: MyButtonStyles.iconButtonStyle,
    );
  }
}
