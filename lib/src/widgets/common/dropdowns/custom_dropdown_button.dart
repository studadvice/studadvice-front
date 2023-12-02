import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final Future<List<String>> Function(String)? asyncItems;
  final String labelText;
  final Color backgroundColor;
  final Color borderColor;
  final Color? shadowColor;
  final Color focusedBorderColor;
  final EmptyBuilder emptyBuilder;
  final ErrorBuilder errorBuilder;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownSearch({
    super.key,
    required this.labelText,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.asyncItems,
    required this.onChanged,
    this.shadowColor,
    required this.validator,
    required this.emptyBuilder,
    required this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      compareFn: (item, selectedItem) => item == selectedItem,
      asyncItems: asyncItems,
      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? '');
      },
      dropdownButtonProps: DropdownButtonProps(
        focusColor: borderColor,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      popupProps: PopupPropsMultiSelection.menu(
        constraints: const BoxConstraints(maxHeight: 280),
        menuProps: MenuProps(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          shadowColor: shadowColor,
        ),
        errorBuilder: errorBuilder,
        emptyBuilder: emptyBuilder,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
