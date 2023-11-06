import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart'; // Importez flutter_typeahead
import 'package:stud_advice/common/conf/injection_container.dart';
import 'package:stud_advice/features/user/use_cases/register/services/register_user_information_service.dart';

import '../../../../common/chore/app_fonts_sizes.dart';
import '../../models/city_data.dart';

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
      locator<RegisterUserInformationService>();

  List<CityData> _cities = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TypeAheadField<CityData>(
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
        // TODO continuer, ajouter un validateur et faire en sorte que le message quand il n'y a pas de suggestion soit en français.
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
      ),
    );
  }
}
