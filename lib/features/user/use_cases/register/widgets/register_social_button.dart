import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_fonts_sizes.dart';

class RegisterSocialButton extends StatelessWidget {
  final String imagePath;
  final Color tileBackgroundColor;
  final Color borderColor;
  final Color? iconColor;
  final String buttonText;
  final VoidCallback onTap;

  RegisterSocialButton({
    required this.imagePath,
    required this.tileBackgroundColor,
    required this.borderColor,
    this.iconColor,
    required this.buttonText,
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
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(25),
          color: tileBackgroundColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                color: iconColor,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.large16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
