import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/dependency_injection/di.dart';
import 'package:food_delivery/features/auth/forget_password/views/views/forget_password_screen.dart';
import 'package:food_delivery/features/auth/login/presentation/views/screens/login_screen.dart';
import 'package:food_delivery/features/auth/sign_up/presentation/views/screens/signup_screen.dart';
import 'package:food_delivery/features/card/presentation/views/add_card_screen.dart';
import 'package:food_delivery/features/home/presentation/views/screens/home_screen.dart';
import 'package:food_delivery/features/initial/initial_screen.dart';
import 'package:food_delivery/features/payment/presentation/views/screens/payment_screen.dart';
import 'package:food_delivery/features/personal_data/presentation/views/personal_data_screen.dart';
import 'package:food_delivery/features/search/presentation/views/search_screen.dart';
import 'package:food_delivery/features/tabs/presentation/views/tabs_screen.dart';

import '../../features/search/presentation/cubit/get_filter_products_cubit.dart';

abstract class MyPages {
  static const String initialScreen = '/';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String forgetPasswordScreen = '/fgpassword';
  static const String homeScreen = '/home';
  static const String tabsScreen = '/tabs';
  static const String paymentScreen = '/payment';
  static const String addCardScreen = '/addCard';
  static const String searchScreen = '/search';
  static const String personalEditScreen = '/personalEdit';

  // static const String productDetail = '/productDetail';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyPages.loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case MyPages.signupScreen:
      return MaterialPageRoute(builder: (context) => SignupScreen());

    case MyPages.forgetPasswordScreen:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());

    case MyPages.homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());

    case MyPages.tabsScreen:
      return MaterialPageRoute(builder: (context) => TabsScreen());

    case MyPages.paymentScreen:
      return MaterialPageRoute(builder: (context) => PaymentScreen());

    case MyPages.addCardScreen:
      return MaterialPageRoute(builder: (context) => AddCardScreen());

    case MyPages.searchScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<GetFilterProductsCubit>(
      create: (context) => getIt<GetFilterProductsCubit>(),
          child: SearchScreen(),
        ),
      );
    case MyPages.personalEditScreen:
      return MaterialPageRoute(builder: (context) => PersonalDataScreen());

    // case MyPages.homeScreen:
    //   return MaterialPageRoute(builder: (context) => HomeScreen());

    default:
      return MaterialPageRoute(builder: (context) => InitialScreen());
  }
}
