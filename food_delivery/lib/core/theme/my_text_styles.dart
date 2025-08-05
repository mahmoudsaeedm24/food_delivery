//!    TextStyle   //!

import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/theme/font_sizes.dart';

class MyTextStyles {
  MyTextStyles._();

  ///! main headlines 1
  static TextStyle textHeadline1Style = TextStyle(
    fontSize: FontSizes.xl,
    fontWeight: FontWeight.bold,
  );

  static TextStyle homeScreentHeadline1Style = TextStyle(
    fontSize: FontSizes.xl,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  ///! secondary headlines 2
  static TextStyle textHeadline2Style = TextStyle(
    fontSize: FontSizes.lg,
    fontWeight: FontWeight.bold,
  );

  static TextStyle visaTextStyle = TextStyle(
    fontSize: FontSizes.lg,
  );

  ///! secondary headlines 2
  static TextStyle textHeadline3Style = TextStyle(
    fontSize: FontSizes.md,
    fontWeight: FontWeight.w800,
  );

  ///! TextButton
  static TextStyle textLinkStyle = TextStyle(
    color: MyColors.primaryColor,

    fontWeight: FontWeight.bold,
    fontSize: FontSizes.sm,
  );

  static TextStyle textBodyStyle = TextStyle(fontSize: FontSizes.sm);
}
