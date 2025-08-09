import 'package:flutter/material.dart';
import 'package:frontend/core/theme/my_text_styles.dart';
import 'package:frontend/features/auth/Presentation/views/widgets/auth_bottom_options_widget.dart';

class AuthScreenBodyWidget extends StatelessWidget {
  const AuthScreenBodyWidget({
    super.key,
    required this.title,
    required this.formWidget,
    required this.loginPage,
  });
  final String title;
  final Widget formWidget;
  final bool loginPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 40,

        children: [
          Text(title, style: MyTextStyles.textHeadline1Style),
          formWidget,
          AuthBottomOptionsWidget(loginPage: loginPage),
        ],
      ),
    );
  }
}
