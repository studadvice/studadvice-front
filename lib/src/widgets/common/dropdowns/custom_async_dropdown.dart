import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/dropdowns/custom_dropdown.dart';

class CustomAsyncDropdownSearch<T> extends CustomDropdownSearch<T> {
  final Future<List<T>> Function(String)? asyncItems;

  const CustomAsyncDropdownSearch({
    super.key,
    required this.asyncItems,
    required labelText,
    required backgroundColor,
    required borderColor,
    shadowColor,
    required focusedBorderColor,
    required emptyBuilder,
    required errorBuilder,
    required onChanged,
    required validator,
  }) : super(
          labelText: labelText,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          shadowColor: shadowColor,
          items: const [],
          focusedBorderColor: focusedBorderColor,
          emptyBuilder: emptyBuilder,
          errorBuilder: errorBuilder,
          onChanged: onChanged,
          validator: validator,
        );

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: (item, selectedItem) => item == selectedItem,
      asyncItems: asyncItems,
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
}
