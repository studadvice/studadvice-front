import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../common/chore/app_colors.dart';
import '../../../../../common/chore/app_fonts_sizes.dart';

class AutoCompleteTextField<T> extends StatelessWidget {
  // HINT Please be aware that the type T must have implemented the toString() method in order to be displayed correctly in the controller when selected.
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Future<List<T>> Function(String pattern) suggestionsCallback;
  final String errorText;
  final String notFoundText;
  final String noItemSelectedText;
  final TextInputType? keyboardType;
  final Widget Function(T) itemBuilder;

  AutoCompleteTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.suggestionsCallback,
    required this.errorText,
    required this.notFoundText,
    required this.noItemSelectedText,
    required this.itemBuilder,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TypeAheadFormField<T>(
          textFieldConfiguration: TextFieldConfiguration(
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom),
            controller: controller,
            style: const TextStyle(
              fontSize: AppFontSizes.large16,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedBorderColor, width: 1.1),
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
            keyboardType: keyboardType ?? TextInputType.text,
          ),
          suggestionsCallback: suggestionsCallback,
          errorBuilder: (context, error) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorText,
                style: const TextStyle(
                  color: AppColors.dangerColor,
                  decoration: TextDecoration.none,
                ),
              ),
            );
          },
          noItemsFoundBuilder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                notFoundText,
                style: const TextStyle(
                  color: AppColors.dangerColor,
                  decoration: TextDecoration.none,
                ),
              ),
            );
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: itemBuilder(suggestion),
            );
          },
          onSuggestionSelected: (suggestion) {
            controller.text = suggestion.toString();
          },
          validator: (value) {
            if (controller.text.isEmpty) {
              return noItemSelectedText;
            }
            return null;
          },
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
            scrollbarThumbAlwaysVisible: false,
            scrollbarTrackAlwaysVisible: false,
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
          )),
    );
  }
}
