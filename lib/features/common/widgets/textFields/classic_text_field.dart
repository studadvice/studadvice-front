import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/chore/app_fonts_sizes.dart';

class ClassicTextField extends StatefulWidget {
  final String hintText; // Placeholder text.
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const ClassicTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  State<ClassicTextField> createState() => _ClassicTextFieldState();
}

class _ClassicTextFieldState extends State<ClassicTextField> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void setState(fn) {
    // To fix the error: setState() called after dispose()
    // Please see: https://stackoverflow.com/questions/49340116/setstate-called-after-dispose
    if (mounted) {
      super.setState(fn);
    }
  }

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
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters ?? [],
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
