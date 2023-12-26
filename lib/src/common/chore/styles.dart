import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class Styles {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: const Color(0xFF303030),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.pink,
    brightness: Brightness.light,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
      // TODO add the color of the input cursor
    ),
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    // #F0F0F0
    scaffoldBackgroundColor: const Color(0xFFF0F0F0),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
  );
}
