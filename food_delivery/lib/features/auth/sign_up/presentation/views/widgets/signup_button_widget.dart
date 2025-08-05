import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/controllers/cubit/sign_up_cubit.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({super.key, required this.policyChecked, required this.onPressed}):assert(!policyChecked || onPressed != null)
;
  final bool policyChecked;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: policyChecked ? onPressed : null,

            style: MyButtonStyles.mainButtonStyle,
            child: BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return CircularProgressIndicator();
                } else {
                  return Text("Register");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
