import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/models/city/city_data.dart';
import 'package:stud_advice/src/services/register/register_user_information_service.dart';

class CityAutocomplete extends StatefulWidget {
  final String hintText; // Placeholder text.
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const CityAutocomplete(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.backgroundColor,
      required this.borderColor,
      required this.focusedBorderColor});

  @override
  State<CityAutocomplete> createState() => _CityAutocompleteState();
}

class _CityAutocompleteState extends State<CityAutocomplete> {
  final RegisterUserInformationService _registerUserInformationService =
      Get.find<RegisterUserInformationService>();
  final String notFoundText = 'Aucune suggestion trouvée.';
  final String errorText = 'Une erreur est survenue.';
  final String noCitySelectedText = 'Veuillez sélectionner une suggestion.';

  List<CityData> _cities = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TypeAheadFormField<CityData>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: widget.controller,
          style: const TextStyle(
              fontSize: AppFontSizes.large16, decoration: TextDecoration.none),
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
        suggestionsCallback: (pattern) async {
          return await _registerUserInformationService
              .fetchCitiesFromAPI(pattern);
        },
        errorBuilder: (context, error) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(errorText,
                style: const TextStyle(
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
        noItemsFoundBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(notFoundText,
                style: const TextStyle(
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.nom ?? ''),
          );
        },
        onSuggestionSelected: (suggestion) {
          setState(() {
            widget.controller.text = suggestion.nom ?? '';
            _cities.clear();
          });
        },
        validator: (value) {
          if (_cities.isEmpty) {
            return noCitySelectedText;
          }
          return null;
        },
      ),
    );
  }
}
