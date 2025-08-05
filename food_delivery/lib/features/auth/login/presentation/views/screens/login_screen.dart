import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/router.dart';
import 'package:food_delivery/features/auth/Presentation/views/screens/auth_screen_body_widget.dart';
import 'package:food_delivery/features/auth/login/presentation/views/widgets/login_form_widget.dart';

import '../../../../../../core/dependency_injection/di.dart' as di;
import '../../controller/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => di.getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginStateSuccess():
              {
                Navigator.pushReplacementNamed(context, MyPages.tabsScreen);
              }

            case LoginStateFailed():
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("${state.e}")));
            case LoginStateLoading():
            case LoginStateInitial():
              null;
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: AuthScreenBodyWidget(
            title: "Login to Your account",
            formWidget: LoginFormWidget(),
            loginPage: true,
          ),
        ),
      ),
    );
  }
}
