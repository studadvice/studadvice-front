import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/conf/injection_container.dart';
import 'package:stud_advice/src/models/city/city_data.dart';
import 'package:stud_advice/src/models/user/user_data.dart';
import 'package:stud_advice/src/services/register/register_user_information_service.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/dropdowns/custom_dropdown_button.dart';
import 'package:stud_advice/src/widgets/pickers/country_picker_field.dart';
import 'package:stud_advice/src/widgets/pickers/date_picker_field.dart';
import 'package:stud_advice/src/widgets/textFields/auto_complete_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';

class RegisterUserInformationScreen extends StatefulWidget {
  static const String navigatorId = 'register_user_information_screen';

  const RegisterUserInformationScreen({super.key});

  @override
  State<RegisterUserInformationScreen> createState() =>
      _RegisterUserInformationScreenState();
}

class _RegisterUserInformationScreenState
    extends State<RegisterUserInformationScreen> {
  // Use constants to facilitate the implementation of the translation.
  final String screenTitle = 'Veuillez renseigner les informations suivantes';
  final String pseudoHintText = 'Pseudo';
  final String postalCodeHintText = 'Code Postal';
  final String postalCodeLabelText = 'Code Postal';
  final String birthDateHintText = 'Date de naissance';
  final String birthDateLabelText = 'Date de naissance';
  final String cityHintText = 'Ville';
  final String cityLabelText = 'Ville';
  final String universityHintText = 'Université';
  final String universityLabelText = 'Université';
  final String countryHintText = 'Pays d\'origine';
  final String countryLabelText = 'Pays d\'origine';
  final String formationHintText = 'Formation';
  final String formationLabelText = 'Formation';
  final String nextButtonText = 'Suivant';
  final String cityNotFoundText = 'Ville non trouvée';
  final String cityNotSelectedText = 'Veuillez sélectionner une ville';
  final String universityNotSelectedText =
      'Veuillez sélectionner une université';
  final String universityNotFound = 'Votre université n\'a pas été trouvée';
  final String universityErrorText = 'Une erreur est survenue';
  final String cityErrorText = 'Une erreur est survenue';
  final String postalCodeErrorText = 'Une erreur est survenue';
  final String postalCodeNotFoundText =
      'Code postal non trouvé, veuillez saisir une ville valide';
  final String postalCodeNotSelectedText =
      'Veuillez sélectionner un code postal';

  // Controllers for the text fields.
  final TextEditingController pseudoController = TextEditingController(
    text: RegisterUserInformationService.generateRandomPseudo(),
  );
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController formationController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  // Services.
  final RegisterUserInformationService _registerUserInformationService =
      locator<RegisterUserInformationService>();

  // Model data.
  late UserData userData;

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    pseudoController.dispose();
    birthDateController.dispose();
    cityController.dispose();
    universityController.dispose();
    formationController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          screenTitle,
          style: (const TextStyle(
            fontSize: AppFontSizes.large16,
            fontWeight: FontWeight.bold,
          )),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        // Wrap in a ListView to avoid overflow when the keyboard is displayed.
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
              child: Column(
            children: [
              const SizedBox(height: 10),
              buildPseudoTextField(),
              const SizedBox(height: 10),
              buildCityTextField(),
              const SizedBox(height: 10),
              buildPostalCodeDropdown(),
              const SizedBox(height: 10),
              buildBirthDateTextField(),
              const SizedBox(height: 10),
              buildUniversityTextField(),
              const SizedBox(height: 10),
              buildFormationTextField(),
              const SizedBox(height: 10),
              buildCountryTextField(),
              const SizedBox(height: 50),
              buildNextButton(),
            ],
          )),
        ],
      ),
    );
  }

  Widget buildPseudoTextField() {
    return ClassicTextField(
      hintText: pseudoHintText,
      labelText: pseudoHintText,
      controller: pseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildCityTextField() {
    return AutoCompleteTextField<CityData>(
      controller: cityController,
      labelText: cityLabelText,
      hintText: cityHintText,
      backgroundColor: AppColors.white,
      borderColor: AppColors.secondaryColor,
      focusedBorderColor: AppColors.secondaryColor,
      suggestionsCallback: (pattern) async {
        return await _registerUserInformationService
            .fetchCitiesFromAPI(pattern);
      },
      errorText: universityErrorText,
      notFoundText: cityNotFoundText,
      noItemSelectedText: cityNotSelectedText,
      itemBuilder: (suggestion) {
        return Text(suggestion.nom ?? '');
      },
    );
  }

  Widget buildPostalCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: CustomDropdownSearch(
        labelText: postalCodeLabelText,
        backgroundColor: AppColors.white,
        borderColor: AppColors.secondaryColor,
        focusedBorderColor: AppColors.secondaryColor,
        asyncItems: (String filter) => _registerUserInformationService
            .fetchPostalCodesFromApi(cityController.text),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return postalCodeNotSelectedText;
          }
          return value;
        },
        onChanged: (String? selectedItem) {
          userData.postalCode = (selectedItem ?? '') as int;
          return null;
        },
        errorBuilder: (context, postalCodeErrorText, reload) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(postalCodeErrorText,
                style: const TextStyle(
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
        emptyBuilder: (context, reload) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(postalCodeNotFoundText,
                style: const TextStyle(
                    fontSize: AppFontSizes.medium,
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
      ),
    );
  }

  Widget buildBirthDateTextField() {
    return DatePickerField(
      hintText: birthDateHintText,
      controller: birthDateController,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildUniversityTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: CustomDropdownSearch(
        labelText: universityLabelText,
        backgroundColor: AppColors.white,
        borderColor: AppColors.secondaryColor,
        focusedBorderColor: AppColors.secondaryColor,
        asyncItems: (String filter) =>
            _registerUserInformationService.fetchUniversityData(filter),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return universityNotSelectedText;
          }
          return value;
        },
        onChanged: (String? selectedItem) {
          userData.university = selectedItem ?? '';
          return null;
        },
        errorBuilder: (context, universityErrorText, reload) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(universityErrorText,
                style: const TextStyle(
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
        emptyBuilder: (context, reload) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(universityNotFound,
                style: const TextStyle(
                    fontSize: AppFontSizes.medium,
                    color: AppColors.dangerColor,
                    decoration: TextDecoration.none)),
          );
        },
      ),
    );
  }

  Widget buildFormationTextField() {
    return ClassicTextField(
      hintText: formationHintText,
      labelText: formationLabelText,
      controller: formationController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildCountryTextField() {
    return CountryPickerField(
        controller: countryController,
        hintText: countryHintText,
        labelText: countryLabelText,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildNextButton() {
    return DefaultConnectionButton(
        text: nextButtonText,
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () {
          // TODO add the logic to connect the user
        });
  }
}
