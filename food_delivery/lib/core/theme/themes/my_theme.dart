import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_button_styles.dart';
import 'package:food_delivery/core/theme/my_text_styles.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: MyTextStyles.textHeadline3Style,
    
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(style: MyButtonStyles.mainButtonStyle ),
  textButtonTheme: TextButtonThemeData(style: MyButtonStyles.linkButtonStyle)
  // inputDecorationTheme: InputDecorationTheme()
);
