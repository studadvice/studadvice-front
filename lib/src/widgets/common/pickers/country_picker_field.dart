import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryPickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Color borderColor;
  final Color focusedBorderColor;

  const CountryPickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  Future<void> _selectCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        controller.text = country.name;
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "country_picker.title".tr;
          }
          return null;
        },
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 1.1),
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
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
