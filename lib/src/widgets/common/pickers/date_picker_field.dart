import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class DatePickerField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    Future<void> selectDate() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        helpText: "date_picker_field.label".tr,
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode
            .calendarOnly, // Have an issue with the input mode.
        initialDatePickerMode: DatePickerMode.year,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.blue,
              hintColor: AppColors.blue,
              colorScheme: const ColorScheme.light(primary: AppColors.blue),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null && pickedDate != selectedDate) {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: "date_picker_field.label".tr,
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
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () {
          selectDate();
        },
      ),
    );
  }
}
