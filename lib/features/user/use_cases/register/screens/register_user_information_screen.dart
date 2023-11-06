import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stud_advice/features/user/common/widgets/city_autocomplete.dart';
import 'package:stud_advice/features/user/common/widgets/country_picker_field.dart';

import '../../../../../common/chore/app_colors.dart';
import '../../../../../common/chore/app_fonts_sizes.dart';
import '../../../common/widgets/classic_text_field.dart';
import '../../../common/widgets/date_text_field.dart';
import '../../../common/widgets/default_connection_button.dart';
import '../services/register_user_information_service.dart';

class RegisterUserInformationScreen extends StatefulWidget {
  static const String navigatorId = 'register_user_information_screen';

  const RegisterUserInformationScreen({super.key});

  @override
  State<RegisterUserInformationScreen> createState() =>
      _RegisterUserInformationScreenState();
}

class _RegisterUserInformationScreenState
    extends State<RegisterUserInformationScreen> {
  // State variables.

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

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    pseudoController.dispose();
    birthDateController.dispose();
    postalCodeController.dispose();
    cityController.dispose();
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
              buildPostalCodeTextField(),
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

  // Widget buildCityTextField() {
  //   return ClassicTextField(
  //     hintText: cityHintText,
  //     controller: cityController,
  //     backgroundColor: AppColors.white,
  //     focusedBorderColor: AppColors.secondaryColor,
  //     borderColor: AppColors.secondaryColor,
  //   );
  // }

  Widget buildCityTextField() {
    return CityAutocomplete(
      hintText: cityHintText,
      controller: cityController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildBirthDateTextField() {
    return DateTextField(
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

  Widget buildPostalCodeTextField() {
    return ClassicTextField(
      hintText: postalCodeHintText,
      controller: postalCodeController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(5), // 5 digits max.
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      // TODO (penser à auto remplir le code postal en fonction de la localisation.)
    );
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
