import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';


// const TextTheme _textThemeDark = new TextTheme(
//
// );

class Styles {
   
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.latoTextTheme(),
      hintColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      )
  );

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.latoTextTheme(),
      hintColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      )
  );

}
