import 'package:flutter/material.dart';
import 'package:frontend/src/utils/themes/widget_theme/app_bar_them.dart';
import 'package:frontend/src/utils/themes/widget_theme/bottom_navigation_bar_them.dart';
import 'package:frontend/src/utils/themes/widget_theme/elevated_button_theme.dart';
import 'package:frontend/src/utils/themes/widget_theme/outlined_button_theme.dart';
import 'package:frontend/src/utils/themes/widget_theme/text_field_theme.dart';
import 'widget_theme/txt_theme.dart';

class CAppTheme {
  CAppTheme._();
  static ThemeData ligthTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CTextTheme.ligthTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.ligthOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.ligthElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.ligthInputDecorationTheme,
    appBarTheme: CAppBarTheme.ligthAppBarTheme,
    bottomNavigationBarTheme:
        CBottomNavigationBarThem.ligthBottomNavigationBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CTextTheme.darkTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    bottomNavigationBarTheme:
        CBottomNavigationBarThem.darkBottomNavigationBarTheme,
  );
}
