import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color borderColor;
  final Color focusedBorderColor;

  const CountryPickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  @override
  State<CountryPickerField> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _selectCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        widget.controller.text = country.name;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        onTap: () {
          _selectCountry(context);
        },
        controller: widget.controller,
        readOnly: true,
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
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
