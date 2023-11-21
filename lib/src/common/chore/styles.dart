import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

// const TextTheme _textThemeDark = new TextTheme(
//
// );

const Color lightBlue = Color(0xFF8ECAE6);
const Color darkBlue = Color(0xFF219EBC);
const Color darkerBlue = Color(0xFF023047);
const Color yellow = Color(0xFFFFB703);
const Color orange = Color(0xFFFB8500);

class Styles {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      color: lightBlue,
      iconTheme: IconThemeData(color: darkerBlue),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    hintColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      color: lightBlue,
      iconTheme: IconThemeData(color: darkerBlue),
    ),
  );

}
