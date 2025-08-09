import 'package:flutter/material.dart';
import 'package:frontend/core/theme/my_button_styles.dart';
import 'package:frontend/core/utils/router.dart';

class HomeTopSearchButtonWidget extends StatelessWidget {
  const HomeTopSearchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {
        Navigator.pushNamed(context, MyPages.searchScreen);
      },
      icon: Icon(Icons.search),
      style: MyButtonStyles.iconButtonStyle,
    );
  }
}
