import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final Color tileBackgroundColor;
  final Color borderColor;
  final Color? iconColor;
  final String? buttonText;
  final VoidCallback onTap;
  final double borderRadius;
  final double imageSize;
  final double padding;
  final double? width;

  SocialButton({
    required this.imagePath,
    required this.tileBackgroundColor,
    required this.borderColor,
    required this.onTap,
    required this.borderRadius,
    required this.imageSize,
    required this.padding,
    this.iconColor,
    this.buttonText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Ink(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
          color: tileBackgroundColor,
        ),
        child: Container(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  color: iconColor,
                  height: imageSize,
                ),
                if (buttonText != null) const SizedBox(width: 10),
                if (buttonText != null)
                  Text(
                    buttonText!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
              ],
            )),
      ),
    );
  }
}
