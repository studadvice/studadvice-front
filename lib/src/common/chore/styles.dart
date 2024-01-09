import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class Styles {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.red,
    canvasColor: AppColors.customBlack, // TODO temporally using this varriable
    cardColor: AppColors.customBlack,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.customBlack,
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
    cardColor: AppColors.customGrey,
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.pink,
    brightness: Brightness.light,
    canvasColor: AppColors.white,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
      // TODO add the color of the input cursor
    ),
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
  );
}
