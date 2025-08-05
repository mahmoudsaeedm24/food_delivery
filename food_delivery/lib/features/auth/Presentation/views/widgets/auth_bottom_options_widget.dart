import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/widgets/my_divider.dart';
import 'package:food_delivery/core/utils/router.dart';

import '../../../../../core/theme/my_text_styles.dart';

class AuthBottomOptionsWidget extends StatelessWidget {
  const AuthBottomOptionsWidget({super.key, required this.loginPage});
  final bool loginPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyDivider(startMargin: 10, endMargin: 10),
            Text("Or Sign in with"),
            MyDivider(startMargin: 10, endMargin: 10),
          ],
        ),
        Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.report_gmailerrorred),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.report_gmailerrorred),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.report_gmailerrorred),
            ),
          ],
        ),
        loginPage
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Don't have an aount?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyPages.signupScreen);
                    },
                    child: Text("Register", style:MyTextStyles. textLinkStyle),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("I have an account!"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MyPages.loginScreen,
                        (route) => false,
                      );
                    },
                    child: Text("Sign in", style:MyTextStyles. textLinkStyle),
                  ),
                ],
              ),
      ],
    );
  }
}
