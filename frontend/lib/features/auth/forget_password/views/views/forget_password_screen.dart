import 'package:flutter/material.dart';
import 'package:frontend/features/auth/forget_password/views/widgets/forget_password/forget_password_form_widget.dart';

import '../../../../../core/theme/my_text_styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 40,
          children: [
            Text("Forget password", style: MyTextStyles.textHeadline1Style),
            ForgetPasswordFormWidget(),
          ],
        ),
      ),
    );
  }
}
