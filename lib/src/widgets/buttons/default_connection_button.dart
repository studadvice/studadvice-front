import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class DefaultConnectionButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const DefaultConnectionButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  State<DefaultConnectionButton> createState() =>
      _DefaultConnectionButtonState();
}

class _DefaultConnectionButtonState extends State<DefaultConnectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: widget.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 120),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontWeight: FontWeight.w400,
          fontSize: AppFontSizes.large16,
        ),
      ),
    );
  }
}
