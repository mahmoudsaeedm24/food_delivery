import 'package:flutter/material.dart';
import 'package:frontend/core/components/widgets/s_text_field_widget.dart';
import 'package:frontend/features/auth/Presentation/views/widgets/auth_form_widget.dart';
import 'package:frontend/features/auth/forget_password/views/widgets/forget_password/forget_password_button_widget.dart';
import 'package:frontend/core/utils/my_validator.dart';

class ForgetPasswordFormWidget extends StatefulWidget {
  const ForgetPasswordFormWidget({super.key});

  @override
  State<ForgetPasswordFormWidget> createState() =>
      _ForgetPasswordFormWidgetState();
}

class _ForgetPasswordFormWidgetState extends State<ForgetPasswordFormWidget> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formState;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formState = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      formKey: _formState,
      children: [
        Text(
          "Enter your email address and we'll send you confirmation code to reset your password",
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        STextFieldWidget(
          controller: _emailController,
          label: "Email Address",
          validator: MyValidator.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 50),
        ForgetPasswordButtonWidget(),
      ],
    );
  }
}
