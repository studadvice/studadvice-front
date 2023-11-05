import 'package:flutter/material.dart';

import '../../../../common/chore/app_fonts_sizes.dart';

class ConnectionPasswordTextField extends StatefulWidget {
  final String hintText; // Placeholder text.
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const ConnectionPasswordTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  @override
  State<ConnectionPasswordTextField> createState() =>
      _ConnectionPasswordTextFieldState();
}

class _ConnectionPasswordTextFieldState
    extends State<ConnectionPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: const TextStyle(
            fontSize: AppFontSizes.large16, decoration: TextDecoration.none),
        decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 1.1),
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )),
      ),
    );
  }
}
