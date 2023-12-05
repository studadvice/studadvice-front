import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String labelText;
  final Color backgroundColor;
  final Color borderColor;
  final Color? shadowColor;
  final Color focusedBorderColor;
  final EmptyBuilder emptyBuilder;
  final ErrorBuilder errorBuilder;
  final String? Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownSearch({
    super.key,
    required this.labelText,
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    this.shadowColor,
    required this.validator,
    required this.emptyBuilder,
    required this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: (item, selectedItem) => item == selectedItem,
      items: items,
      selectedItem: selectedItem,
      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem.toString());
      },
      dropdownButtonProps: DropdownButtonProps(
        focusColor: borderColor,
      ),
      dropdownDecoratorProps: buildDropDownDecoratorProps(),
      popupProps: buildPopupPropsMultiSelection(),
      onChanged: onChanged,
      validator: validator,
    );
  }

  PopupPropsMultiSelection<T> buildPopupPropsMultiSelection() {
    return PopupPropsMultiSelection.menu(
      constraints: const BoxConstraints(maxHeight: 280),
      menuProps: MenuProps(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        shadowColor: shadowColor,
      ),
      errorBuilder: errorBuilder,
      emptyBuilder: emptyBuilder,
    );
  }

  DropDownDecoratorProps buildDropDownDecoratorProps() {
    return DropDownDecoratorProps(
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
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
