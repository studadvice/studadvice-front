import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  RegisterWithEmailButton({
    required this.onPressed,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.blue,
    this.borderColor = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    const String continueWithEmailText = "Continuer avec un E-Mail";

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: Text(
        continueWithEmailText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.large16,
        ),
      ),
    );
  }
}
