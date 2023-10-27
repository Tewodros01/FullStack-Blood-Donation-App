import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/src/constants/colors.dart';

class CAppBarTheme {
  CAppBarTheme._();

  static AppBarTheme ligthAppBarTheme = AppBarTheme(
    backgroundColor: cWhiteColor,
    foregroundColor: cPrimaryColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 17.sp,
      color: cPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(color: cPrimaryColor),
    iconTheme: const IconThemeData(color: cPrimaryColor),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: cDarkColor,
    foregroundColor: cPrimaryColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 17.sp,
      color: cPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(color: cPrimaryColor),
    iconTheme: const IconThemeData(color: cPrimaryColor),
  );
}
