import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final String text;

  RegisterWithEmailButton(
      {required this.onPressed,
      this.backgroundColor = AppColors.white,
      this.textColor = AppColors.blue,
      this.borderColor = AppColors.blue,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.large16,
        ),
      ),
    );
  }
}
