import 'package:flutter/material.dart';
import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
import 'package:stud_advice/stud_advice.dart';

class CustomAdaptativeButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;

  const CustomAdaptativeButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    this.horizontalPadding = 120.0,
    this.verticalPadding = 15.0,
    this.borderRadius = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveElevatedButton(
      onPressed: onPressed,
      materialButtonStyle: _buildMaterialButtonStyle(),
      child: _buildButtonText(),
    );
  }

  ButtonStyle _buildMaterialButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
    );
  }

  Text _buildButtonText() {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        backgroundColor: backgroundColor,
        fontWeight: FontWeight.w400,
        fontSize: AppFontSizes.large16,
      ),
    );
  }
}