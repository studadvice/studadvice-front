import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color borderColor;
  final Color focusedBorderColor;
  final String? Function(String?)? validator;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.borderColor,
    required this.focusedBorderColor,
    this.validator,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;
  String labelText = 'Date de naissance';

  @override
  void setState(fn) {
    // To fix the error: setState() called after dispose()
    // Please see: https://stackoverflow.com/questions/49340116/setstate-called-after-dispose
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        helpText: labelText,
        lastDate: DateTime.now(),
        locale: const Locale(currentLanguage, currentCountry));

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.focusedBorderColor, width: 1.1),
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
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}
