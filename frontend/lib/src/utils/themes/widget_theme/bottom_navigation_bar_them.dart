import 'package:flutter/material.dart';
import 'package:frontend/src/constants/colors.dart';

class CBottomNavigationBarThem {
  CBottomNavigationBarThem._();

  static BottomNavigationBarThemeData ligthBottomNavigationBarTheme =
      const BottomNavigationBarThemeData(
    backgroundColor: cWhiteColor,
    selectedItemColor: cPrimaryColor,
    selectedIconTheme: IconThemeData(
      color: cPrimaryColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black12,
    ),
  );

  static BottomNavigationBarThemeData darkBottomNavigationBarTheme =
      const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    backgroundColor: cDarkColor,
    selectedItemColor: cPrimaryColor,
    selectedIconTheme: IconThemeData(
      color: cPrimaryColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black12,
    ),
  );
}
