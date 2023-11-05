import 'package:flutter/material.dart';

class RegisterWithEmailButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  RegisterWithEmailButton({
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.blue,
    this.borderColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    const String continueWithEmailText = "Continuer avec un E-Mail";

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 100),
      ),
      child: Text(
        continueWithEmailText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
