import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_colors.dart';
import 'package:stud_advice/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/common/conf/injection_container.dart';
import 'package:stud_advice/features/common/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/features/common/widgets/dropdowns/custom_dropdown_button.dart';
import 'package:stud_advice/features/common/widgets/pickers/country_picker_field.dart';
import 'package:stud_advice/features/common/widgets/pickers/date_picker_field.dart';
import 'package:stud_advice/features/common/widgets/textFields/auto_complete_text_field.dart';
import 'package:stud_advice/features/common/widgets/textFields/classic_text_field.dart';
import 'package:stud_advice/features/user/models/city_data.dart';
import 'package:stud_advice/features/user/use_cases/register/services/register_user_information_service.dart';

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
  final String birthDateHintText = 'Date de naissance';
  final String cityHintText = 'Ville';
  final String universityHintText = 'Université';
  final String countryHintText = 'Pays d\'origine';
  final String formationHintText = 'Formation';
  final String nextButtonText = 'Suivant';
  final String cityNotFoundText = 'Ville non trouvée';
  final String cityNotSelectedText = 'Veuillez sélectionner une ville';
  final String cityErrorText = 'Une erreur est survenue';
  final String postalCodeErrorText = 'Une erreur est survenue';
  final String postalCodeNotFoundText = 'Code postal non trouvé';
  final String postalCodeNotSelectedText =
      'Veuillez sélectionner un code postal';

  // Controllers for the text fields.
  final TextEditingController pseudoController = TextEditingController(
    text: RegisterUserInformationService.generateRandomPseudo(),
  );
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController formationController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  // Services.
  final RegisterUserInformationService _registerUserInformationService =
      locator<RegisterUserInformationService>();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    pseudoController.dispose();
    birthDateController.dispose();
    postalCodeController.dispose();
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
      controller: pseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildCityTextField() {
    return AutoCompleteTextField<CityData>(
      controller: cityController,
      hintText: cityHintText,
      backgroundColor: AppColors.white,
      borderColor: AppColors.secondaryColor,
      focusedBorderColor: AppColors.secondaryColor,
      suggestionsCallback: (pattern) async {
        return await _registerUserInformationService
            .fetchCitiesFromAPI(pattern);
      },
      errorText: cityErrorText,
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
      child: CustomDropdownButton(
        hint: postalCodeHintText,
        // value: '59000',
        validator: (value) {
          if (value == null) {
            return 'Please select a postal code';
          }
          return null;
        },
        // TODO utiliser la liste stocker pour le controller des villes
        dropdownItems: ['59000', '59100', '59200', '59300', '59400', '59500'],
        onChanged: (value) {
          // postalCodeController.text = value!;
        },
        onSaved: (value) {
          // postalCodeController.text = value!;
        },
        buttonDecoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.secondaryColor,
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        iconEnabledColor: AppColors.secondaryColor,
        buttonHeight: 57,
        scrollbarRadius: const Radius.circular(14),
        scrollbarThickness: 3,
        scrollbarAlwaysShow: false,
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
    return ClassicTextField(
      hintText: universityHintText,
      controller: universityController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildFormationTextField() {
    return ClassicTextField(
      hintText: formationHintText,
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
