import 'package:flutter/material.dart';

class LoginSocialButton extends StatelessWidget {
  final String imagePath;
  final Color tileBackgroundColor;
  final Color borderColor;
  final Color? iconColor;
  final VoidCallback onTap;

  LoginSocialButton({
    required this.imagePath,
    required this.tileBackgroundColor,
    required this.borderColor,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16),
          color: tileBackgroundColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            imagePath,
            color: iconColor,
            height: 25,
            width: 25,
          ),
        ),
      ),
    );
  }
}
