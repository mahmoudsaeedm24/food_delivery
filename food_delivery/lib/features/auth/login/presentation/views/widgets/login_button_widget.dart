import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';
import '../../controller/cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: MyButtonStyles.mainButtonStyle,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginStateLoading) {
                  return CircularProgressIndicator();
                } else {
                  return Text("Login");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
