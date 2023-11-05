import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_fonts_sizes.dart';

class InitTimeConnectionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  const InitTimeConnectionButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Text(text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.large16,
                )),
          ),
        ),
      ),
    );
  }
}
