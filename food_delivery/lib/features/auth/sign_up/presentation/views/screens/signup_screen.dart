import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/dependency_injection/di.dart';
import 'package:food_delivery/core/utils/router.dart';
import 'package:food_delivery/features/auth/Presentation/views/screens/auth_screen_body_widget.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/controllers/cubit/sign_up_cubit.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/views/widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              switch (state) {
                case SignUpFailed():
                  {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Error ${state.e}")));
                  }
                case SignUpSuccess():
                  {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      MyPages.loginScreen,
                      (route) => false,
                    );
                  }
                case SignUpInitial():
                case SignUpLoading():
                  null;
              }
            },
            child: Scaffold(
              appBar: AppBar(),
              body: AuthScreenBodyWidget(
                title: "Create Your new account",
                formWidget: SignupFormWidget(),
                loginPage: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
