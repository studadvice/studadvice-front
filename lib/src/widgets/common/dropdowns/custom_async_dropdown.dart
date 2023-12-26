import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/widgets.dart';

class CustomAsyncDropdownSearch<T> extends CustomDropdownSearch<T> {
  final Future<List<T>> Function(String)? asyncItems;

  const CustomAsyncDropdownSearch({
    super.key,
    required this.asyncItems,
    required super.labelText,
    required super.backgroundColor,
    required super.borderColor,
    super.shadowColor,
    required super.focusedBorderColor,
    required super.emptyBuilder,
    required super.errorBuilder,
    required super.onChanged,
    required super.validator,
    super.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: (item, selectedItem) => item == selectedItem,
      asyncItems: asyncItems,
      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem != null ? selectedItem.toString() : '');
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
