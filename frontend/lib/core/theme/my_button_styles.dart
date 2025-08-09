import 'package:flutter/material.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/core/theme/my_text_styles.dart';

class MyButtonStyles {
  MyButtonStyles._();
  //! ------------------------------------------
  static ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(MyColors.primaryColor),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 60, vertical: 20),
    ),
    iconColor: WidgetStatePropertyAll(MyColors.fontColor),
    foregroundColor: WidgetStatePropertyAll(MyColors.fontColor),
    alignment: Alignment.center,

    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
    ),
  );
  //! ---------------------------------------------
  //! polices ,
  static ButtonStyle linkButtonStyle = ButtonStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.zero),
    minimumSize: WidgetStatePropertyAll(Size(0, 0)),

    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    textStyle: WidgetStatePropertyAll(MyTextStyles.textLinkStyle),
  );
  //!----------------------------------------------
  //!  seeAll
  static ButtonStyle linkButton2Style = ButtonStyle();
  //! -----------------------------------------------
  static ButtonStyle iconButtonStyle = ButtonStyle(
    iconColor: WidgetStatePropertyAll(Colors.white),
    side: WidgetStatePropertyAll(
      BorderSide(color: Colors.white, width: 2, strokeAlign: 2),
    ),
  );
}
