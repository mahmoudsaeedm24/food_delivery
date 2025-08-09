import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/widgets/s_text_field_widget.dart';
import 'package:frontend/core/theme/my_text_styles.dart';
import 'package:frontend/core/utils/my_validator.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/features/auth/Presentation/views/widgets/auth_form_widget.dart';
import 'package:frontend/features/auth/login/presentation/views/widgets/login_button_widget.dart';

import '../../controller/cubit/login_cubit.dart';
import '../../../domain/user_entity_login.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late TextEditingController _emailController, _passwordController;
  late GlobalKey<FormState> _formState;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formState = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      formKey: _formState,
      children: [
        STextFieldWidget(
          controller: _emailController,
          label: "Email Address",
          validator: MyValidator.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        STextFieldWidget(
          controller: _passwordController,
          label: "Password",
          isPasswordField: true,
          validator: MyValidator.simpleValidatePassword,
          keyboardType: TextInputType.visiblePassword,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, MyPages.forgetPasswordScreen);
          },
          child: Text("Forget Password", style: MyTextStyles.textLinkStyle),
        ),
        LoginButtonWidget(
          onPressed: () async {
            if (_formState.currentState!.validate()) {
              UserEntityLogin user = UserEntityLogin(
                email: _emailController.text.trim(),
                password: _passwordController.text,
              );
              await context.read<LoginCubit>().login(user);
            }
          },
        ),
      ],
    );
  }
}
