import 'package:flutter/material.dart';

class LoginConnectionButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const LoginConnectionButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LoginConnectionButton> createState() => _LoginConnectionButtonState();
}

class _LoginConnectionButtonState extends State<LoginConnectionButton> {
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
          fontSize: 16,
        ),
      ),
    );
  }
}
