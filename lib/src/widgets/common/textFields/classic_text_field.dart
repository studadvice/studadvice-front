import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class ClassicTextField extends StatefulWidget {
  final String hintText; // Placeholder text
  final String? labelText;
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final Function(dynamic)? onChanged;
  final List<String>? autofillHints;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;

  const ClassicTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.labelText,
    this.keyboardType,
    this.onTap,
    this.autofillHints,
    this.suffixIcon,
    this.onChanged,
    this.validator,
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
      child: TextFormField(
        controller: widget.controller,
        autofocus: true,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        style: const TextStyle(
            fontSize: AppFontSizes.large16, decoration: TextDecoration.none),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusedBorderColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
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
              : widget.suffixIcon != null
                  ? IconButton(
                      icon: widget.suffixIcon!,
                      onPressed: widget.onTap,
                    )
                  : null,
        ),
        onTap: widget.onTap,
        autofillHints: widget.autofillHints,
        readOnly: widget.onTap != null,
      ),
    );
  }
}
