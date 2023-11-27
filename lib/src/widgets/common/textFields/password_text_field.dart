import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText; // Placeholder text.
  final String labelText;
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final List<String>? autofillHints;
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.autofillHints,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        controller: widget.controller,
        obscureText: _obscureText,
        validator: widget.validator,
        style: const TextStyle(
            fontSize: AppFontSizes.large16, decoration: TextDecoration.none),
        decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 1.1),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
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
