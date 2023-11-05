import 'package:flutter/material.dart';

import '../../../../common/chore/app_fonts_sizes.dart';

class ConnectionClassicTextField extends StatefulWidget {
  final String hintText; // Placeholder text.
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const ConnectionClassicTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  @override
  State<ConnectionClassicTextField> createState() =>
      _ConnectionClassicTextFieldState();
}

class _ConnectionClassicTextFieldState
    extends State<ConnectionClassicTextField> {
  bool _showClearButton = false;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.isNotEmpty;
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
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
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    widget.controller.text = '';
                    _showClearButton = false;
                  },
                )
              : null,
        ),
      ),
    );
  }
}
