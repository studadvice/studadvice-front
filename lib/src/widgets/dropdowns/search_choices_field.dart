import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class SearchChoicesField extends StatelessWidget {
  final String hintText;
  final String searchHintText;
  final String labelText;
  final String closeText;
  final Function? onChanged;
  final bool? isExpanded;
  final Function? displayItem;
  final Color inputDecorationBorderColor;
  final Color inputDecorationFocusedBorderColor;
  final Color menuBackgroundColor;
  final Color fieldBackgroundColor;
  final Color textColor;
  final Function? searchFn;
  final List<DropdownMenuItem<String>> itemList;

  const SearchChoicesField(
      {super.key,
      required this.hintText,
      required this.searchHintText,
      required this.labelText,
      required this.itemList,
      this.searchFn,
      this.onChanged,
      this.isExpanded,
      this.displayItem,
      required this.inputDecorationBorderColor,
      required this.inputDecorationFocusedBorderColor,
      required this.menuBackgroundColor,
      required this.closeText,
      required this.fieldBackgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SearchChoices.single(
      hint: hintText,
      fieldDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: inputDecorationBorderColor, width: 0.50),
        color: fieldBackgroundColor,
        shape: BoxShape.rectangle,
      ),
      searchHint: hintText,
      onChanged: onChanged,
      displayItem: displayItem,
      // label: labelText,
      items: itemList,
      closeButton: closeText,
      dropDownDialogPadding: const EdgeInsets.symmetric(
        vertical: 110,
        horizontal: 15,
      ),
      isExpanded: true,
      displayClearIcon: false,
      clearSearchIcon: const Icon(Icons.clear),
      menuBackgroundColor: Colors.white,
      style: TextStyle(
        fontSize: AppFontSizes.medium,
        color: textColor,
      ),
      searchInputDecoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: inputDecorationFocusedBorderColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: inputDecorationBorderColor, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: inputDecorationFocusedBorderColor, width: 1.1),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
